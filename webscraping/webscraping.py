import requests
from bs4 import BeautifulSoup
import os
import zipfile

URL = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"

response = requests.get(URL)
response.raise_for_status()

soup = BeautifulSoup(response.text, "html.parser")

links = soup.find_all("a", href=True)

pdf_links = [link["href"] for link in links if "Anexo" in link.text and link["href"].endswith(".pdf")]

print("Links encontrados: ", pdf_links)

os.makedirs("pdfs", exist_ok=True)

for i, pdf_link in enumerate(pdf_links, 1):
  pdf_url = pdf_link if pdf_link.startswith("http") else f"https://www.gov.br{pdf_link}"
  pdf_response = requests.get(pdf_url)

  pdf_filename = f"pdfs/anexo_{i}.pdf"

  with open(pdf_filename, "wb") as pdf_file:
    pdf_file.write(pdf_response.content)

  print(f"Baixado: {pdf_filename}")

zip_filename = "anexos.zip"

with zipfile.ZipFile(zip_filename, "w") as zipf:
  for i in range(1, len(pdf_links) + 1):
    zipf.write(f"pdfs/anexo_{i}.pdf")

print(f"Arquivos compactados em {zip_filename}")