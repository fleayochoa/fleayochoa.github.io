### A Pluto.jl notebook ###
# v0.20.20

using Markdown
using InteractiveUtils

# ╔═╡ d6727510-b921-11f0-b14b-c3e51fea43bb
begin
using HypertextLiteral
using DataStructures
end

# ╔═╡ 50e831dc-371e-4d8f-93c9-67a7c6c9fd21
### Función para mostrar cuadros con título y texto
function cuadro(titulo::AbstractString, texto::AbstractString,
                color_fondo="#E6F7FF", color_borde="#2196F3")
    @htl("""
    <div style="
        background-color:$(color_fondo);
        border-left:6px solid $(color_borde);
        padding:12px;
        margin:10px 0;
        border-radius:8px;
        box-shadow:2px 2px 4px rgba(0,0,0,0.1);
        font-family: 'Segoe UI', sans-serif;">
        
        <div style="font-weight:bold; font-size:1.1em; color:$(color_borde); margin-bottom:5px;">
            $(titulo)
        </div>
        
        <div style="color:#333; line-height:1.4;">
            $(texto)
        </div>
    </div>
    """)
end;

# ╔═╡ 9f8bec1f-f15b-4831-98e3-c96e6f6a648d
cuadro("Guía introductoria para desafíos", 
	  "El siguiente documento es una guía complementaria que puede ser muy útil para su prototipado electrónico usando microcontroladores, motores, relays, etc.",
	  "#FCCABA", "#C93508")

# ╔═╡ ccd7a6a8-db8d-4336-8407-fa7b1c960f57
function cuadro_links(titulo::String, enlaces::OrderedDict, colores=Dict())
    principal = get(colores, "principal", "#0033A0")
    fondo = get(colores, "fondo", "#F9F9F9")
    texto = get(colores, "texto", "#222222")

    items = [
        @htl("<li><a href='$url' style='text-decoration: underline;'>📚$nombre</a></li>")
        for (nombre, url) in enlaces
    ]

    @htl("""
    <div style="
        background-color: $fondo;
        border-left: 6px solid $principal;
        border-radius: 10px;
        padding: 12px 18px;
        margin: 10px 0;
        font-family: sans-serif;">
        <h3 style="color: $principal; margin-top: 0;">$titulo</h3>
        <ul style="list-style-type: none; padding-left: 0;">
            $items
        </ul>
    </div>
    """)
end;


# ╔═╡ 62db8e53-ffe5-481e-9caf-06acd0dd1d1a
colores = Dict(
    "azul_bg"=> "#E6F7FF",
	"azul_bd"=> "#2196F3",
    "amarillo_bg"=> "#FFE4B8",
	"amarillo_bd"=> "#C9A208",
    "rojo_bg"=> "#FCCABA",
    "rojo_bd"=> "#C93508"
);

# ╔═╡ be3177cd-caf2-47fc-9f00-adc728121576
begin enlaces = OrderedDict(
    "Introducción" => "desafios/intro.html",
    "Relays" => "desafios/relay.html",
    "Diodos" => "desafios/diodes.html",
	"Motores" => "desafios/motores.html",
	"Cómo puedo alimentar mi circuito"=> "desafios/power.html"
)

prueba = Dict(
    "principal" => colores["amarillo_bd"],
    "fondo" => colores["amarillo_bg"],
    "texto" => "#1A1A1A"
)
cuadro_links("Navegación", enlaces, prueba)
end


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
DataStructures = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
HypertextLiteral = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"

[compat]
DataStructures = "~0.19.1"
HypertextLiteral = "~0.9.5"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.12.1"
manifest_format = "2.0"
project_hash = "513efe786dbb97dcdc156d05c05acd24aebc9cb1"

[[deps.DataStructures]]
deps = ["OrderedCollections"]
git-tree-sha1 = "6c72198e6a101cccdd4c9731d3985e904ba26037"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.19.1"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "7134810b1afce04bbc1045ca1985fbe81ce17653"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.5"

[[deps.OrderedCollections]]
git-tree-sha1 = "05868e21324cede2207c6f0f466b4bfef6d5e7ee"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.8.1"

[[deps.Tricks]]
git-tree-sha1 = "311349fd1c93a31f783f977a71e8b062a57d4101"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.13"
"""

# ╔═╡ Cell order:
# ╟─d6727510-b921-11f0-b14b-c3e51fea43bb
# ╟─9f8bec1f-f15b-4831-98e3-c96e6f6a648d
# ╠═be3177cd-caf2-47fc-9f00-adc728121576
# ╠═50e831dc-371e-4d8f-93c9-67a7c6c9fd21
# ╠═ccd7a6a8-db8d-4336-8407-fa7b1c960f57
# ╠═62db8e53-ffe5-481e-9caf-06acd0dd1d1a
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
