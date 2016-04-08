# Eyetribe Eyetracker Analyser
This project aims to record and analyze viewing patters of users on a website. It can be used to identify which parts of a website attract a user the most, therby helping the developer improve the UI and UX.

## Boring technical terms:-
- *Area of Interest*: - Areas of interest (AOIs) are parts of a stimulus that are of high importance for a hypothesis. In 3D stimuli, AOIs can also be models or objects of interest (OOIs). For dynamic stimuli, dynamic AOIs have to be defined. AOIs can either be created beforehand or after an eye tracking experiment. Usually, AOIs are created based on the semantic information of the stimulus. A transition is a movement from one AOI to another. Typical metrics for AOIs are the transition count (i.e. number of transitions between two AOIs), the dwell time within an AOI in milliseconds, and the AOI hit which defines if a fixation is within an AOI or not.
- *Gaze point*: - Gaze point is the area where one is looking at.

- *Fixation point*: - A fixation is an aggregation of gaze points. Gaze points are aggregated based on a specified area and timespan. Common metrics for fixations are the fixation count (i.e. number of fixations), the fixation duration in milliseconds, and the fixation position given as x- and y-coordinates in pixel.

- *Scan Path*: - A sequence of alternating fixations and saccades is called a scanpath. A scanpath can give information about the search behavior of a participant. An ideal scanpath would be a straight line to a specified target. Deviance from this ideal scanpath can be interpreted as poor search. Scanpath metrics include the convex hull (i.e. which area is covered by the scanpath), scanpath length in pixels, or scanpath duration in milliseconds

## Usage(LOL)
`
    bash script.sh
`

_Make sure you change the input file name according the the name given in the script_

To display the scanlines, run `bash scanline.sh`. Change the file name in the script accordingly.

## NOTE
The scanlines shown in the images given have been generated after removing the erronous recordings at the origin(0,0).
