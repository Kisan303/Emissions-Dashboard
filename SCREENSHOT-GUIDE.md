# 📸 How to Add Dashboard Screenshots

Follow these steps to capture and add your dashboard screenshots to the repository.

## Step 1: Take Screenshots

### Open Your Dashboard
1. Navigate to your Emissions Dashboard in Databricks
2. Dashboard URL: `https://dbc-ce5c7ebc-9595.cloud.databricks.com/dashboards/01f170cf76af10b2be836edb371de2e6`

### Capture Screenshots

You need to take **5 screenshots**:

#### 1. **dashboard-overview.png** (Full Dashboard)
   - Open the complete dashboard
   - Make sure all 4 visualizations are visible
   - Take a full-page screenshot
   - Recommended size: 1920x1080 or larger

#### 2. **geographic-map.png** (Geographic Visualization)
   - Click on or zoom into the geographic map widget
   - Capture just the map visualization
   - Include the title and legend

#### 3. **emissions-per-person.png** (Per Capita Chart)
   - Focus on the "Emissions Per Person" bar chart
   - Capture the full chart with axis labels
   - Include the title

#### 4. **top-states.png** (Top States Chart)
   - Focus on the "Top 10 States" bar chart
   - Capture the complete visualization
   - Include all 10 states

#### 5. **top-counties.png** (Top Counties Chart)
   - Focus on the "County Shaming" / Top Counties chart
   - Capture the complete visualization
   - Include all 10 counties

## Step 2: Screenshot Tools

### Windows
- **Snipping Tool** (Win + Shift + S)
- **Full Screen**: PrtScn key
- Save as PNG format

### Mac
- **Area Screenshot**: Cmd + Shift + 4
- **Full Screen**: Cmd + Shift + 3
- Automatically saves as PNG

### Linux
- **Gnome Screenshot**: Shift + PrtScn
- **Flameshot**: flameshot gui
- Save as PNG format

## Step 3: Rename Your Screenshots

Rename your screenshots exactly as follows:
```
dashboard-overview.png
geographic-map.png
emissions-per-person.png
top-states.png
top-counties.png
```

## Step 4: Upload to Repository

### Method 1: Databricks Workspace UI
1. In Databricks, navigate to your repo folder:
   `/Repos/kisanrai939@gmail.com/Emissions-Dashboard/images/`
2. Click the "Upload" button or drag and drop files
3. Upload all 5 PNG files into the `images/` folder

### Method 2: Git Command Line (if you cloned locally)
```bash
# Copy screenshots to the images folder
cp /path/to/your/screenshots/*.png ./images/

# Add to git
git add images/*.png

# Commit
git commit -m "Add dashboard screenshots for documentation"

# Push to GitHub
git push origin main
```

### Method 3: GitHub Web Interface
1. Go to https://github.com/Kisan303/Emissions-Dashboard
2. Navigate to the `images/` folder
3. Click "Add file" → "Upload files"
4. Drag and drop your 5 PNG files
5. Commit with message: "Add dashboard screenshots"

## Step 5: Verify

After uploading:
1. Go to your GitHub repository
2. Navigate to `images/` folder
3. Verify all 5 PNG files are there
4. Open README.md - the images should now display!

## Tips for Best Screenshots

✅ **DO:**
- Use high resolution (at least 1280x720)
- Capture in light mode for better visibility
- Include chart titles and legends
- Make sure data is visible and readable
- Use PNG format (better quality than JPG)

❌ **DON'T:**
- Include sensitive information
- Use low resolution images
- Crop too tightly (leave some padding)
- Include your browser tabs or bookmarks bar

## Image Size Recommendations

- **dashboard-overview.png**: 1920x1080 or larger
- **Individual charts**: 1280x720 minimum
- File size: Keep under 2MB each (GitHub friendly)

## Need Help?

If you have issues:
1. Check file names match exactly (case-sensitive)
2. Verify PNG format
3. Ensure files are in the `images/` folder
4. Make sure you committed and pushed to GitHub

---

Once complete, your README.md will automatically display beautiful dashboard screenshots! 🎉
