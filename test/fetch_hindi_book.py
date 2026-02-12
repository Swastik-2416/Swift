import urllib.request
import urllib.parse
import json
import ssl
import os

def fetch_hindi_book():
    """
    Searches for a Hindi cultural book on Internet Archive and downloads the first PDF found.
    """
    # 1. Search for Hindi cultural books (e.g., Premchand, culture, literature)
    base_url = "https://archive.org/advancedsearch.php"
    query = "language:(hindi) AND (subject:culture OR subject:literature OR title:premchand) AND mediatype:texts"
    params = {
        "q": query,
        "fl[]": ["identifier", "title", "creator"],
        "sort[]": "downloads desc",
        "rows": "5",
        "page": "1",
        "output": "json"
    }
    
    search_url = f"{base_url}?{urllib.parse.urlencode(params, doseq=True)}"
    print(f"Searching Internet Archive...")
    print(f"URL: {search_url}")

    try:
        context = ssl.create_default_context()
        with urllib.request.urlopen(search_url, context=context, timeout=15) as response:
            data = json.loads(response.read().decode('utf-8'))
            
        docs = data.get('response', {}).get('docs', [])
        if not docs:
            print("[FAILURE] No books found matching the criteria.")
            return

        print(f"\nFound {len(docs)} potential books. Checking for PDF...")

        for doc in docs:
            identifier = doc['identifier']
            title = doc.get('title', 'Unknown Title')
            print(f" - Checking item: {title} ({identifier})")
            
            # 2. Get Metadata to find PDF file
            metadata_url = f"https://archive.org/metadata/{identifier}"
            with urllib.request.urlopen(metadata_url, context=context, timeout=15) as meta_response:
                meta_data = json.loads(meta_response.read().decode('utf-8'))
                
            files = meta_data.get('files', [])
            pdf_file = next((f for f in files if f['name'].lower().endswith('.pdf')), None)
            
            if pdf_file:
                pdf_filename = pdf_file['name']
                # URL encode the filename to handle spaces and special chars
                encoded_filename = urllib.parse.quote(pdf_filename)
                download_url = f"https://archive.org/download/{identifier}/{encoded_filename}"
                local_filename = f"{identifier}.pdf" # Keep it simple to avoid path issues with Hindi chars
                
                print(f"   -> Found PDF: {pdf_filename}")
                print(f"   -> Downloading from: {download_url}")
                print(f"   -> Saving to: {local_filename}...")
                
                # 3. Download the file
                # Use a chunked download to avoid memory issues with large files
                with urllib.request.urlopen(download_url, context=context, timeout=60) as dl_response, open(local_filename, 'wb') as out_file:
                    total_size = int(dl_response.getheader('Content-Length', 0))
                    downloaded = 0
                    chunk_size = 8192
                    
                    while True:
                        chunk = dl_response.read(chunk_size)
                        if not chunk:
                            break
                        out_file.write(chunk)
                        downloaded += len(chunk)
                        if total_size > 0:
                            percent = (downloaded / total_size) * 100
                            # Print progress every 1MB or so to keep output clean? actually just update line
                            # for simplicity in this env, just print every 10%
                            # if int(percent) % 10 == 0: ... let's keep it simple.
                            
                print(f"\n[SUCCESS] Downloaded '{title}' to {local_filename}")
                print(f"Size: {downloaded / (1024*1024):.2f} MB")
                return

        print("\n[WARNING] Found items but none had a direct PDF download available in the metadata.")

    except Exception as e:
        print(f"\n[FAILURE] An error occurred: {e}")

if __name__ == "__main__":
    fetch_hindi_book()
