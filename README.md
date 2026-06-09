# [RBVM2026 Slides](https://sjacobozavaleta.github.io/RBVM2026_slides/RBVM2026.html?view=print#/cover)

Presentación en Quarto para el Simposio CEA de Robótica, Bioingeniería, Visión por Computador y Automática Marina 2026 (Bilbao, 10–12 June 2026).

## Descripción

Este repositorio contiene la presentación en formato Quarto (`RBVM2026.qmd`) y los recursos asociados:

- `RBVM2026.qmd`: archivo principal de la presentación.
- `_quarto.yml`: configuración del proyecto Quarto.
- `assets/`: imágenes, logos y figuras.
- `_extensions/`: extensión personalizada `roboticslab-slides`.
- `docs/`: salida generada del sitio/presentación.
- `backup/`: copias de seguridad locales que no se deben versionar.

## Requisitos

- Quarto instalado
- R instalado
- Paquetes R necesarios para los chunks de R, por ejemplo:
  - `ggplot2`
  - `tibble`
  - `dplyr`
  - `scales`

## Cómo compilar

Desde la raíz del proyecto:

```bash
quarto render RBVM2026.qmd
```

Para ver la presentación en modo de desarrollo:

```bash
quarto preview RBVM2026.qmd
```

Si deseas generar la salida directamente en `docs/` como sitio de Quarto:

```bash
quarto render --output-dir docs RBVM2026.qmd
```

## Control de versiones

Este proyecto incluye un archivo `.gitignore` para evitar subir archivos generados, temporales y copias de seguridad.

- `backup/` está excluida intencionalmente.
- Se ignoran los directorios de caché de Quarto y los archivos temporales de R.

## Notas

Mantén el contenido de `assets/`, `_extensions/` y `RBVM2026.qmd` en el control de versiones; solo se deben ignorar los artefactos de compilación y los respaldos locales.
