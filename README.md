# uva-seas-thesis-template
Thesis/Dissertation template for School of Engineering and Applied Science, University of Virginia

# Notes
"There are no UVA Engineering School format requirements or restrictions. Students, advisors and committees are responsible for ensuring that theses and dissertations are clear, readable and professionally presented." -- [UVA Engineering requires electronic thesis and dissertation submission](https://engineering.virginia.edu/current-students/current-graduate-students#accordion1531610)

This is NOT official from UVa SEAS. This template was modified from https://www.sharelatex.com/templates/thesis/princeton-university-thesis.

Apendices include instructions and usage of the template. They were from the original Princeton template.

# How to Use
Fill out and download *Thesis/Dissertation Cover and Approval Pages* from UVa Engineering website [here](https://seas.virginia.edu/forms/thesis-cover-approval.php), replace the "CoverNApproval.pdf" file with your own. Make sure in your "CoverNApproval.pdf" file, page 1 is the cover, page 2 is approval sheet. Otherwise modify ["puthesis.cls"](./puthesis.cls) line 165 and 183 accordingly.   
## Complie
    $ pdflatex thesis
    $ bibtex thesis
    $ makeglossaries thesis
    $ pdflatex thesis
    $ pdflatex thesis

# Some Useful Links
[Graduate Procedure (M.S. and Ph.D. Candidates)](https://engineering.virginia.edu/current-students/current-graduate-students#accordion1531610)   
[Dissertation Title Guildlines](https://engineering.virginia.edu/sites/default/files/common/offices/graduate-programs-office/Files/Dissertation_Title_Recommendations.pdf)
