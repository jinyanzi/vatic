
To change the output text in an OpenCV format, replace this cli.py in the original directory.
Changes are made from line 537 (class dump). Format is as follows:
```
  1   Track ID. All rows with the same ID belong to the same path.
  2   xmin. The top left x-coordinate of the bounding box.
  3   ymin. The top left y-coordinate of the bounding box.
  4   width. The width of the bounding box (different with original format).
  5   height. Theheight of the bounding box (different with original format).
  6   frame. The frame that this annotation represents.
  7   lost. If 1, the annotation is outside of the view screen.
  8   occluded. If 1, the annotation is occluded.
  9   generated. If 1, the annotation was automatically interpolated.
  10  label. The label for this annotation, enclosed in quotation marks.
  11+ attributes. Each column after this is an attribute.
```
