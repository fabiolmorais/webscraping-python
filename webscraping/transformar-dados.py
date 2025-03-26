import pdfplumber
import pandas as pd
import zipfile

pdf_filename = "pdfs/anexo_1.pdf"
data = []
header = None

with pdfplumber.open(pdf_filename) as pdf:
  for page_num, page in enumerate(pdf.pages):
    table = page.extract_table()

    if table:
      clean_table = [[str(cell).replace("\n", " ") if cell else "" for cell in row] for row in table]

      if header is None:
        header = clean_table[0]
        data.extend(clean_table[1:])
      else:
        data.extend(clean_table[1:]) 

df = pd.DataFrame(data, columns=header)

csv_filename = "Rol_de_Procedimentos.csv"
df.to_csv(csv_filename, sep=";", index=False, encoding="utf-8-sig")

print(f"Arquivo {csv_filename} salvo com sucesso!")

zip_filename = f"Teste_Fabio_Morais.zip"

with zipfile.ZipFile(zip_filename, "w") as zipf:
  zipf.write(csv_filename)

print(f"Arquivo compactado como {zip_filename}")

# Vou fazer a substituição das abreviações após zipar o arquivo pq estou seguindo o passo a passo do documento

df.replace({"OD": "Odontológico", "AMB": "Ambulatorial"}, inplace=True)

df.to_csv(csv_filename, sep=";", index=False, encoding="utf-8-sig")