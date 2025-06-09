#!/bin/bash

# AI-NEPI GitHub Pages Deployment Script
echo "🚀 Deploying AI-NEPI to GitHub Pages..."

# Render the Quarto site
echo "📝 Rendering Quarto site..."
quarto render

# Add all changes
echo "📦 Adding changes to git..."
git add .

# Commit with timestamp
echo "💾 Committing changes..."
git commit -m "Update site: $(date '+%Y-%m-%d %H:%M:%S')"

# Push to GitHub
echo "🌐 Pushing to GitHub..."
git push origin main

echo "✅ Deployment complete! Check https://grasshoff.github.io/nepiweb/ in a few minutes."
echo "📊 Monitor deployment at: https://github.com/grasshoff/nepiweb/actions" 