import urllib.request
import urllib.error
import json
import ssl

def check_internet_archive_api():
    """
    Checks if the Internet Archive API is reachable and returning valid data.
    We'll query the metadata API for a well-known item 'nasa'.
    """
    url = "https://archive.org/metadata/nasa"
    
    print(f"Checking Internet Archive API availability...")
    print(f"Target URL: {url}")
    
    try:
        # Create a context that doesn't verify SSL certificates if needed (though usually not recommended for prod)
        # For a simple check script, default context should be fine, but let's be robust.
        context = ssl.create_default_context()
        
        with urllib.request.urlopen(url, context=context, timeout=10) as response:
            status_code = response.getcode()
            
            if status_code == 200:
                data = json.loads(response.read().decode('utf-8'))
                
                # The 'metadata' key contains item details. 'files' contains file list.
                if 'metadata' in data:
                    print("\n[SUCCESS] Internet Archive API is WORKING and returning valid JSON.")
                    if 'identifier' in data['metadata']:
                         print(f"  - Item: {data['metadata']['identifier']}")
                    print(f"  - Title: {data['metadata'].get('title', 'N/A')}")
                elif 'files' in data:
                    print("\n[SUCCESS] Internet Archive API is WORKING (files list found, but no metadata key).")
                    print(f"  - Files count: {len(data['files'])}")
                else:
                    print("\n[WARNING] API returned 200 OK, but response JSON structure was unexpected.")
                    print(f"  - Keys found: {list(data.keys())}")
                    print(f"  - Response snippet: {str(data)[:200]}")
            else:
                print(f"\n[FAILURE] API returned status code: {status_code}")

    except urllib.error.URLError as e:
        print(f"\n[FAILURE] Could not connect to Internet Archive API.")
        print(f"  - Error: {e}")
    except json.JSONDecodeError as e:
        print(f"\n[FAILURE] API returned invalid JSON.")
        print(f"  - Error: {e}")
    except Exception as e:
        print(f"\n[FAILURE] An unexpected error occurred.")
        print(f"  - Error: {e}")

if __name__ == "__main__":
    check_internet_archive_api()
