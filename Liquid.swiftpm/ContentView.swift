import SwiftUI
import SpriteKit
import CoreImage
import CoreMotion

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            // We pass the size to the helper function
            SpriteView(scene: makeScene(size: geometry.size))
                .ignoresSafeArea()
        }
        .overlay(
            VStack {
                Text("Tilt phone to move water")
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.top, 60)
                Spacer()
            }
        )
    }
    
    // Create the scene only when size is valid
    func makeScene(size: CGSize) -> SKScene {
        // If the app is still loading and size is tiny, give a default
        let safeSize = size.width > 0 ? size : CGSize(width: 400, height: 800)
        
        let scene = LiquidScene()
        scene.size = safeSize
        scene.scaleMode = .resizeFill
        return scene
    }
}

class LiquidScene: SKScene {
    
    let liquidEffectNode = SKEffectNode()
    let motionManager = CMMotionManager()
    
    // Flag to ensure we only fill the tank once
    var hasFilledTank = false
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        // 1. Add the effect node immediately
        // (Even if empty, it needs to be in the scene hierarchy)
        if liquidEffectNode.parent == nil {
            setupLiquidShader()
            addChild(liquidEffectNode)
        }
        
        // 2. Setup Walls
        updatePhysicsWalls()
        
        // 3. Start Tilt
        startMonitoringTilt()
        
        // 4. Attempt to spawn water
        // We call this here to ensure it runs on first load
        trySpawnWater()
    }
    
    override func didChangeSize(_ oldSize: CGSize) {
        // This runs when you rotate the phone
        updatePhysicsWalls()
        
        // If the scene started at size (0,0) and just got big, try spawning now
        trySpawnWater()
    }
    
    func trySpawnWater() {
        // SAFETY CHECK: If already full, or screen is too small, stop.
        if hasFilledTank || size.width < 50 || size.height < 50 { return }
        
        fillContainerWithLiquid()
        hasFilledTank = true
    }
    
    func updatePhysicsWalls() {
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        borderBody.friction = 0.0
        self.physicsBody = borderBody
    }
    
    // MARK: - Liquid Setup
    func setupLiquidShader() {
        liquidEffectNode.shouldEnableEffects = true
        
        let blur = CIFilter(name: "CIGaussianBlur")
        blur?.setValue(15.0, forKey: kCIInputRadiusKey)
        liquidEffectNode.filter = blur
        
        let shaderSource = """
        void main() {
            vec4 color = texture2D(u_texture, v_tex_coord);
            if (color.a > 0.4) {
                gl_FragColor = vec4(0.0, 0.5, 1.0, 0.9);
            } else {
                gl_FragColor = vec4(0.0);
            }
        }
        """
        liquidEffectNode.shader = SKShader(source: shaderSource)
    }
    
    // MARK: - Spawning Logic
    func fillContainerWithLiquid() {
        let ballRadius: CGFloat = 6
        let diameter = ballRadius * 2
        
        // Fill the bottom 50%
        let startY = frame.minY + ballRadius + 10
        let endY = frame.midY
        
        let startX = frame.minX + ballRadius + 10
        let endX = frame.maxX - ballRadius - 10
        
        // Safety check to prevent infinite loops if coordinates are weird
        guard endY > startY, endX > startX else { return }
        
        for y in stride(from: startY, to: endY, by: diameter + 2) {
            for x in stride(from: startX, to: endX, by: diameter + 2) {
                createDrop(at: CGPoint(x: x, y: y), radius: ballRadius)
            }
        }
    }
    
    func createDrop(at position: CGPoint, radius: CGFloat) {
        let drop = SKShapeNode(circleOfRadius: radius)
        drop.position = position
        drop.fillColor = .white
        drop.strokeColor = .clear
        
        drop.physicsBody = SKPhysicsBody(circleOfRadius: radius)
        drop.physicsBody?.isDynamic = true
        drop.physicsBody?.restitution = 0.1
        drop.physicsBody?.friction = 0.0
        drop.physicsBody?.linearDamping = 0.1
        drop.physicsBody?.density = 2.0
        
        liquidEffectNode.addChild(drop)
    }
    
    // MARK: - Tilt Logic
    func startMonitoringTilt() {
        guard motionManager.isAccelerometerAvailable else { return }
        motionManager.accelerometerUpdateInterval = 0.02
        motionManager.startAccelerometerUpdates()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if let accelerometerData = motionManager.accelerometerData {
            let sensitivity: Double = 15.0
            physicsWorld.gravity = CGVector(
                dx: accelerometerData.acceleration.x * sensitivity,
                dy: accelerometerData.acceleration.y * sensitivity
            )
        }
    }
}
