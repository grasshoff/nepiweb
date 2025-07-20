#!/bin/bash

# AI-NEPI Book Deployment Script
echo "🚀 Building AI-NEPI Book..."

# Render the Quarto book
echo "📝 Rendering Quarto book..."
quarto render

echo "✅ Book build complete! Output in docs/ directory."
echo "📁 To deploy to GitHub Pages, copy contents to nepiweb/ and push." 