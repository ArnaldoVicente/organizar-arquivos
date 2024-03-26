# Define os caminhos das pastas de origem e destino
$origem = "C:\Caminho\Para\Pasta\Origem"
$destinoTextos = "C:\Caminho\Para\Pasta\Destino\Textos"
$destinoImagens = "C:\Caminho\Para\Pasta\Destino\Imagens"
$destinoPDFs = "C:\Caminho\Para\Pasta\Destino\PDFs"
$destinoOutros = "C:\Caminho\Para\Pasta\Destino\Outros"

# Lista todos os arquivos na pasta de origem
$arquivos = Get-ChildItem -Path $origem

# Para cada arquivo na pasta de origem
foreach ($arquivo in $arquivos) {
    # Determina a extensão do arquivo
    $extensao = $arquivo.Extension.ToLower()

    # Move o arquivo para a pasta de destino correspondente com base na extensão do arquivo
    switch ($extensao) {
        ".txt", ".doc", ".docx" {
            Move-Item -Path $arquivo.FullName -Destination $destinoTextos
        }
        ".jpg", ".png", ".gif" {
            Move-Item -Path $arquivo.FullName -Destination $destinoImagens
        }
        ".pdf" {
            Move-Item -Path $arquivo.FullName -Destination $destinoPDFs
        }
        default {
            Move-Item -Path $arquivo.FullName -Destination $destinoOutros
        }
    }
}

Write-Host "Processo concluído."
