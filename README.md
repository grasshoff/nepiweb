# AI-NEPI Enhanced Quarto Book

This directory contains the enhanced Quarto book generated from XML content reports of the AI-NEPI conference presentations.

## Overview

The AI-NEPI Enhanced Quarto Book System converts structured XML content reports into a comprehensive, navigable Quarto book format. This system replaces the deprecated manual chapter generation approach with an automated workflow that:

- Processes XML content reports from `performance/ai-nepi_XXX/report/`
- Extracts structured presentation content with sections and slide references
- Synchronizes slide images with presentation content
- Generates properly formatted Quarto chapters with YAML front matter
- Creates a complete book with navigation, references, and bibliography

## Key Features

### Automated Processing
- **XML Parsing**: Handles XML content reports with BeautifulSoup for robust parsing
- **Slide Integration**: Automatically maps slide references to actual image files
- **Content Structure**: Preserves the hierarchical structure of presentations
- **Image Management**: Copies and organizes slide images in the book's image directory

### Enhanced Format
- **Structured Chapters**: Each presentation becomes a chapter with proper sectioning
- **Slide Synchronization**: Images appear at appropriate points in the text flow
- **Rich Metadata**: Includes abstracts, author information, and bibliographic data
- **Navigation**: Full Quarto book navigation with table of contents

### Output Formats
- **HTML**: Interactive web-based book with search and navigation
- **PDF**: Print-ready document (requires LaTeX)

## Files Structure

```
book/
├── _quarto.yml              # Quarto book configuration
├── index.qmd                # Book introduction and preface
├── chapter_ai-nepi_XXX.qmd  # Individual presentation chapters
├── references.qmd           # References section
├── bibliography.bib        # Bibliography file
├── images/                  # Slide images directory
│   └── ai-nepi_XXX_slide_XX.jpg
├── _build/                  # Generated output
│   ├── index.html          # Main book HTML
│   ├── chapter_*.html      # Chapter HTML files
│   └── images/             # Image assets
└── README.md               # This file
```

## Generation Process

The book is generated using the AI-NEPI partitur system:

```bash
# From the ai-nepi project root:
ai-partitur partitur/ai-nepi-generate-quarto-book.ai [profile_id]
```

This executes the `generate_quarto_book` function which:

1. **Scans Performance Directory**: Finds all `*_content_report.xml` files
2. **Processes XML Content**: Extracts title, overview, sections, and slide references
3. **Generates Chapters**: Creates `.qmd` files with proper formatting
4. **Copies Images**: Transfers slide images to the book's images directory
5. **Creates Book Structure**: Generates configuration and navigation files

## Building the Book

After generation, build the book using Quarto:

```bash
cd book
quarto render                # Build both HTML and PDF
quarto render --to html      # HTML only
quarto render --to pdf       # PDF only (requires LaTeX)
```

## XML Content Report Format

The system expects XML files with this structure:

```xml
<report>
  <metadata>
    <title>Presentation Title</title>
    <!-- ... other metadata ... -->
  </metadata>
  <presentation>
    <overview>Brief presentation overview...</overview>
    <section number="1" slide_reference="tm:00:41">
      <title>Section Title</title>
      <text>Section content...</text>
    </section>
    <!-- ... more sections ... -->
  </presentation>
</report>
```

## Author Information Source

Author information is extracted from two primary sources:

### Primary Source: `setting/presentation.json`
- **Authoritative Data**: Contains the official presenter names for each performance ID
- **Workshop Schedule**: Includes complete workshop schedule with session titles and timing
- **Multi-Author Support**: Handles presentations with multiple co-presenters (e.g., "Author A & Author B")
- **Performance Mapping**: Direct correlation between performance IDs and presenter names

### Secondary Source: `setting/Presenters-and-Co-Authors.json`
- **Detailed Information**: Provides affiliation, email, and other presenter metadata
- **Name Matching**: System automatically matches presenter names to extract affiliations
- **Contact Information**: Includes email addresses when available

The system prioritizes presenter names from `presentation.json` and enhances them with affiliation information from the detailed presenter database.

## Slide Image Mapping

Slide references in the format `tm:MM:SS` are converted to slide numbers using:
- Time-based approximation (assumes slides change every ~45 seconds)
- Only images that actually exist are referenced
- Images are renamed to `ai-nepi_XXX_slide_YY.jpg` format

## Generated on
- **System**: AI-NEPI Partitur Workflow
- **Function**: `function/generate_quarto_book.py`
- **Partitur**: `partitur/ai-nepi-generate-quarto-book.ai`
- **Generated**: May 2025

## Technical Implementation

The generation system is implemented in Python with:
- **BeautifulSoup**: XML parsing with lxml backend
- **PyYAML**: Configuration file generation
- **Pathlib**: Cross-platform path handling
- **Shutil**: File operations and image copying

For more details, see:
- `function/generate_quarto_book.py` - Main implementation
- `partitur/ai-nepi-generate-quarto-book.ai` - Workflow definition 