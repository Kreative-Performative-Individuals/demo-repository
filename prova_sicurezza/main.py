import requests

# Mock API Key for testing secret scanning
API_KEY = "12345-abcde-67890-fghij"

# Vulnerable library usage (e.g., a deprecated SSL certificate verification method)
def fetch_data(url):
    response = requests.get(url, verify=False)  # Trivy should flag "verify=False" as insecure
    return response.text

if __name__ == "__main__":
    print(fetch_data("https://example.com"))
