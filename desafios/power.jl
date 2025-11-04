### A Pluto.jl notebook ###
# v0.20.20

using Markdown
using InteractiveUtils

# ╔═╡ ef59dfd0-b98c-11f0-b701-a320d2c8ea8d
begin
using HypertextLiteral
using DataStructures
using PlutoUI
end

# ╔═╡ 4af1aee6-d4d2-446f-a743-27e2a8661ba9
LocalResource("./power.png",
					  :width => 800)

# ╔═╡ 45adf599-ab46-474b-be87-f1620fcc18e4
LocalResource("regulador.jpg")

# ╔═╡ f656ba72-e989-4ef0-8bb4-eb6c8f23784c
LocalResource("switching.webp",
			 :width=>200,
			 :alt => "Regulador switching")

# ╔═╡ 214287e1-8bf6-4e62-878d-8a1e405b0e0a
### Función para mostrar cuadros con título y texto
function cuadro(titulo::String, texto::String,
                color_fondo="#E6F7FF", color_borde="#2196F3")

	texto_html = HTML(replace(texto, "\n" => "<br>"))

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
            <p>$(texto_html) </p>
        </div>
    </div>
    """)
end;

# ╔═╡ a57fd3b7-bec7-4941-aff3-c354441a2503
cuadro("🛠¿Cuáles son los requisitos de mi circuito?",
  "Como todos los problemas de ingeniería, parte de conocer el problema es conocer las restricciones de la solución. En nuestro caso necesitamos responder las siguientes preguntas: ¿Cuánta corriente necesito? ¿Necesito diferentes niveles de voltaje en mi circuito? ¿El prototipo puede estar conectado al tomacorriente o tiene que ser de batería? 
	   
En base a esto, podemos comenzar a descartar soluciones")


# ╔═╡ 3c123600-c9a2-4253-ae5c-fc26195e5b50
cuadro("⚡¿Cuánta corriente necesita mi circuito?",
	  "Recordemos que una fuente de voltaje entrregará tanta corriente como pueda con tal de mantener una diferencia de voltaje de 5V en sus terminales.
	   
	   ¿Y cómo puedo llegar a decir que un componente consume mucha corriente en mi circuito? En lo personal, para este caso, recomiendo comparar la máxima corriente que puede llegar a consumir un componente con la máxima corriente que puede suministrar tu microcontrolador.
	   
	   Por ejemplo, el arduino UNO tiene un regulador lineal de 5V que podría llegar a entregar hasta 500mA (Mientras la fuente que alimenta el arduino sea capaz de entregar más que eso). Sin embargo, recomiendo no sobrepasar los 200mA. Si aumentamos el consumo de corriente, el regulador se calentará más y reducirá la vida útil de nuestro microcontrolador.
	   
	   Entonces, la pregunta del millón ¿Cómo sé cuánta corriente consume mi circuito? Para esto, debemos buscar las datasheets de nuestros componentes, por ejemplo, un LED típico de arduino consume unos 10mA con una caída de 2V aproximadamente, un servomotor chico, puede llegar a consumir hasta 200mA mientras se mueve. Debemos tener en consideración todos los componentes que tienen un consumo significativo de corriente para tener un aproximado de la cantidad de corriente total que consume el circuito.
	   
	   ")

# ╔═╡ 8b766f15-84e4-4ac3-bc25-8ba3847fc489
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


# ╔═╡ 9f89e199-2844-41a8-86fe-f4c996eeee34
colores = Dict(
    "azul_bg"=> "#E6F7FF",
	"azul_bd"=> "#2196F3",
    "amarillo_bg"=> "#FFE4B8",
	"amarillo_bd"=> "#C9A208",
    "rojo_bg"=> "#FCCABA",
    "rojo_bd"=> "#C93508"
);

# ╔═╡ 84099fba-4d1a-4cc2-906e-211f80f6d94f
cuadro("¿Cómo puedo alimentar mi cricuito?", "Bienvenid@ a la cápsula introductoria para alimentar tus circuitos.
	   
	   Esta es una guía condensadísima y básica sobre como armar circuitos de alimentación, recuerda siempre respetar los límites de seguridad de cada componente e investigar por tu cuenta. Una conexión mal hecha o límite no respetado puede llegar a quemar tu circuito COMPLETO.", 
	   colores["rojo_bg"], colores["rojo_bd"])

# ╔═╡ a20e5381-e6d2-477b-8978-bd93a985c1ea
cuadro("🔋¿Necesito baterías?",
	  "Escoger que batería usar y cómo se usan pueden llegar a ser preguntas difíciles de responder al comienzo, cada una cumple con distintas funciones y tienen distintas capacidades. 
	   
	   En el caso de no necesitar baterías podemos usar distintos tipos de fuentes de voltaje externas, fuentes de 9V 5V, etc. El principal desafío en este caso consiste en encontrar los conectores necesarios y un regulador de voltaje de ser necesario.", colores["rojo_bg"], colores["rojo_bd"])

# ╔═╡ 1eef0327-c443-4641-9e74-bd4fe3251bbe
cuadro("✌ Reguladores de voltaje",
	  "Los reguladores de voltaje son un mundo por sí mismos, sin embargo, en esta guía nos quedaremos con la parte más simplificada. 
	   Un regulador de voltaje es un componente electrónico que mantiene un voltaje fijo en la salida mientras el voltaje de entrada cumpla con algunas condiciones. En esta guía abordaremos 2 tipos de reguladores de voltaje, los reguladores lineales y los reguladores conmutadores (switching).", colores["amarillo_bg"], colores["amarillo_bd"])

# ╔═╡ 052af18d-bb16-4fa6-8547-7d18f390e988
cuadro("Regulador lineal de voltaje",
	  "Un regulador lineal de voltaje se encarga de mantener un voltaje constante en la salida disipando en forma de calor el 'voltaje sobrante' por llamarlo de alguna manera, es decir, si por ejemplo, alimentas un regulador lineal de 5V con 7V, el regulador tendrá una caída (7-5)V = 2V y disipará esa energía en forma de calor.
	   
	   La ventaja de estos reguladores es que suelen ser muy baratos y sencillos para la carga que pueden llegar a manejar, además, la salida suele ser muy limpia en términos de ruido. La desventaja viene con la eficiencia energética y la disipación de calor. Nuestro regulador lineal disipará aún más potencia conforme haya más diferencia de voltaje entre el voltaje de alimentación y el voltaje de salida, por lo que el ideal es alimentarlo con una fuente lo más cercana posible al voltaje de salida siempre considerando el rango operacional del regulador.", colores["rojo_bg"], colores["rojo_bd"])

# ╔═╡ f57631e4-d67f-4f6e-9c13-4f01d5230804
cuadro("Regulador tipo switching", 
	   "Un regulador tipo switching actúa de una manera completamente distinta al regulador lineal, este tipo de reguladores actúan apagando y prendiendo un switch muy rápido (en el orden de 100kHz hacia arriba.) almacena la energía en un componente pasivo y la libera de forma controlada.
	   
	   La ventaja de este tipo de reguladores es que suele ser mucho más eficientes que un regulador lineal, es fácil de encontrar reguladores con salida ajustable y además este tipo de topología puede tanto elevar como disminuir el voltaje de salida respecto del voltaje de la entrada (conversor step-up y buck down respectivamente). Sin embargo, no todo son cosas buenas, por la velocidad a la que conmutan, estas fuentes son mucho más ruidosas y pueden llegar a generar interferencia EM, además, es mucho más dificil de diseñar a comparación de un regulador lineal y suelen ser más caras.   ", colores["rojo_bg"], colores["rojo_bd"])

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
DataStructures = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
HypertextLiteral = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
DataStructures = "~0.19.1"
HypertextLiteral = "~0.9.5"
PlutoUI = "~0.7.73"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.12.1"
manifest_format = "2.0"
project_hash = "8b16369cd78be903c7640ad669f7fe0a51499f21"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "6e1d2a35f2f90a4bc7c2ed98079b2ba09c35b83a"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.3.2"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.2"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"
version = "1.11.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "67e11ee83a43eb71ddc950302c53bf33f0690dfe"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.12.1"
weakdeps = ["StyledStrings"]

    [deps.ColorTypes.extensions]
    StyledStringsExt = "StyledStrings"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.3.0+1"

[[deps.DataStructures]]
deps = ["OrderedCollections"]
git-tree-sha1 = "6c72198e6a101cccdd4c9731d3985e904ba26037"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.19.1"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"
version = "1.11.0"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"
version = "1.11.0"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "05882d6995ae5c12bb5f36dd2ed3f61c98cbb172"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.5"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "179267cfa5e712760cd43dcae385d7ea90cc25a4"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.5"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "7134810b1afce04bbc1045ca1985fbe81ce17653"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.5"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "0ee181ec08df7d7c911901ea38baf16f755114dc"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "1.0.0"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"
version = "1.11.0"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.JuliaSyntaxHighlighting]]
deps = ["StyledStrings"]
uuid = "ac6e5ff7-fb65-4e79-a425-ec3bc9c03011"
version = "1.12.0"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.4"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "OpenSSL_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "8.11.1+1"

[[deps.LibGit2]]
deps = ["LibGit2_jll", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"
version = "1.11.0"

[[deps.LibGit2_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "OpenSSL_jll"]
uuid = "e37daf67-58a4-590a-8e99-b0245dd2ffc5"
version = "1.9.0+0"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "OpenSSL_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.11.3+1"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.12.0"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"
version = "1.11.0"

[[deps.MIMEs]]
git-tree-sha1 = "c64d943587f7187e751162b3b84445bbbd79f691"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "1.1.0"

[[deps.Markdown]]
deps = ["Base64", "JuliaSyntaxHighlighting", "StyledStrings"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"
version = "1.11.0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"
version = "1.11.0"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2025.5.20"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.3.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.29+0"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "3.5.1+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "05868e21324cede2207c6f0f466b4bfef6d5e7ee"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.8.1"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "7d2f8f21da5db6a806faf7b9b292296da42b2810"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.3"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "Random", "SHA", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.12.0"

    [deps.Pkg.extensions]
    REPLExt = "REPL"

    [deps.Pkg.weakdeps]
    REPL = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Downloads", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "3faff84e6f97a7f18e0dd24373daa229fd358db5"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.73"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "07a921781cab75691315adc645096ed5e370cb77"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.3.3"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "0f27480397253da18fe2c12a4ba4eb9eb208bf3d"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.5.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"
version = "1.11.0"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
version = "1.11.0"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"
version = "1.11.0"

[[deps.Statistics]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "ae3bb1eb3bba077cd276bc5cfc337cc65c3075c0"
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.11.1"

    [deps.Statistics.extensions]
    SparseArraysExt = ["SparseArrays"]

    [deps.Statistics.weakdeps]
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.StyledStrings]]
uuid = "f489334b-da3d-4c2e-b8f0-e476e12c162b"
version = "1.11.0"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"
version = "1.11.0"

[[deps.Tricks]]
git-tree-sha1 = "311349fd1c93a31f783f977a71e8b062a57d4101"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.13"

[[deps.URIs]]
git-tree-sha1 = "bef26fb046d031353ef97a82e3fdb6afe7f21b1a"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.6.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"
version = "1.11.0"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
version = "1.11.0"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.3.1+2"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.15.0+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.64.0+1"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.5.0+2"
"""

# ╔═╡ Cell order:
# ╟─84099fba-4d1a-4cc2-906e-211f80f6d94f
# ╟─a57fd3b7-bec7-4941-aff3-c354441a2503
# ╟─a20e5381-e6d2-477b-8978-bd93a985c1ea
# ╟─3c123600-c9a2-4253-ae5c-fc26195e5b50
# ╟─1eef0327-c443-4641-9e74-bd4fe3251bbe
# ╟─052af18d-bb16-4fa6-8547-7d18f390e988
# ╟─45adf599-ab46-474b-be87-f1620fcc18e4
# ╟─f57631e4-d67f-4f6e-9c13-4f01d5230804
# ╟─f656ba72-e989-4ef0-8bb4-eb6c8f23784c
# ╟─4af1aee6-d4d2-446f-a743-27e2a8661ba9
# ╟─214287e1-8bf6-4e62-878d-8a1e405b0e0a
# ╟─8b766f15-84e4-4ac3-bc25-8ba3847fc489
# ╟─9f89e199-2844-41a8-86fe-f4c996eeee34
# ╟─ef59dfd0-b98c-11f0-b701-a320d2c8ea8d
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
