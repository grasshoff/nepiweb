#!/bin/bash

# AI-NEPI GitHub Pages Deployment Script using Quarto Publish
echo "🚀 Deploying AI-NEPI to GitHub Pages with Quarto Publish..."

# Use quarto publish to handle everything
echo "📝 Publishing with Quarto..."
quarto publish gh-pages

echo "✅ Deployment complete! Check https://grasshoff.github.io/nepiweb/ in a few minutes." 