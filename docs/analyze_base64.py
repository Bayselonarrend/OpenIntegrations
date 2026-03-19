import os
import re
from pathlib import Path

def analyze_file(filepath):
    """Analyze a file for long base64 sequences"""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Find base64 patterns in JSON
        base64_pattern = r'"BYTES":\s*"([A-Za-z0-9+/=]{1000,})"'
        matches = re.finditer(base64_pattern, content)
        
        results = []
        for match in matches:
            base64_str = match.group(1)
            line_num = content[:match.start()].count('\n') + 1
            results.append({
                'file': filepath,
                'line': line_num,
                'length': len(base64_str),
                'start_pos': match.start(),
                'end_pos': match.end()
            })
        
        # Also check for data: URLs
        data_url_pattern = r'data:application/[^;]+;base64,([A-Za-z0-9+/=]{1000,})'
        matches = re.finditer(data_url_pattern, content)
        
        for match in matches:
            base64_str = match.group(1)
            line_num = content[:match.start()].count('\n') + 1
            results.append({
                'file': filepath,
                'line': line_num,
                'length': len(base64_str),
                'start_pos': match.start(),
                'end_pos': match.end(),
                'type': 'data_url'
            })
        
        return results
    except Exception as e:
        print(f"Error reading {filepath}: {e}")
        return []

def scan_directory(directory):
    """Scan directory for problematic files"""
    all_results = []
    
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith('.mdx') or file.endswith('.md'):
                filepath = os.path.join(root, file)
                results = analyze_file(filepath)
                all_results.extend(results)
    
    return all_results

if __name__ == '__main__':
    print("Analyzing ru/md for base64 sequences...\n")
    results = scan_directory('ru/md')
    
    if results:
        print(f"Found {len(results)} base64 sequences longer than 1000 characters:\n")
        
        # Group by file
        by_file = {}
        for r in results:
            if r['file'] not in by_file:
                by_file[r['file']] = []
            by_file[r['file']].append(r)
        
        for filepath, items in sorted(by_file.items()):
            print(f"\n{filepath}:")
            for item in items:
                print(f"  Line {item['line']}: {item['length']} characters")
                print(f"  Position: {item['start_pos']}-{item['end_pos']}")
    else:
        print("No problematic base64 sequences found.")
