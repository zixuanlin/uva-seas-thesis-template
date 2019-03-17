\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{puthesis}
         [2008/05/02 v1.4 Princeton University Thesis class]

\LoadClass{report}
         
\RequirePackage{setspace}
\RequirePackage{pdfpages}

% \usepackage{amsfonts}

%% For figures
\RequirePackage{graphicx}
% \usepackage{subfig,rotate}

%% For comments
\RequirePackage{verbatim}

%% For tables
\RequirePackage{multirow}
\RequirePackage{longtable}     % Longtable lets you have tables that span multiple pages.
\RequirePackage{booktabs}     % Booktabs produces far nicer tables than the standard LaTeX tables. % see: http://en.wikibooks.org/wiki/LaTeX/Tables

%% ======================================================settings======================================================
\setlength{\oddsidemargin}{0.5in}   %{.4375in}
\setlength{\evensidemargin}{0.5in} %{.4375in}
\setlength{\topmargin}{-.5in}  %{-.5625in}
\setlength{\footskip}{.25in} % to put page number 3/4" from the bottom of the page (1/4" from bottom of body text)
\setlength{\textheight}{9in}
\setlength{\textwidth}{6in}

%% Alter LaTeX defaults to try to eliminate all widows and orphans
\clubpenalty=10000
\widowpenalty=10000

%% try to avoid overfull lines by limiting how far it is okay to exceed the margins
%% http://www.tex.ac.uk/cgi-bin/texfaq2html?label=overfull
\setlength{\emergencystretch}{1em}

%% ========================Tweak float placements (Alter some LaTeX defaults for better treatment of figures)==========
%% From: http://mintaka.sdsu.edu/GF/bibliog/latex/floats.html "Controlling LaTeX Floats"
%% and based on: http://www.tex.ac.uk/cgi-bin/texfaq2html?label=floats
%% General parameters, for ALL pages:
\renewcommand{\topfraction}{0.85}     % max fraction of floats at top
\renewcommand{\bottomfraction}{0.6}     % max fraction of floats at bottom

%% Parameters for TEXT pages (not float pages):
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{4}     % 2 may work better
\setcounter{dbltopnumber}{2}     % for 2-column pages
\renewcommand{\dbltopfraction}{0.66}     % fit big float above 2-col. text
\renewcommand{\textfraction}{0.15}     % allow minimal text w. figs

%% Parameters for FLOAT pages (not text pages):
\renewcommand{\floatpagefraction}{0.66}     % require fuller float pages % N.B.: floatpagefraction MUST be less than topfraction !!
\renewcommand{\dblfloatpagefraction}{0.66}     % require fuller float pages

%% set parameters for longtable: default caption width is 4in for longtable, but wider for normal tables
\setlength{\LTcapwidth}{\textwidth}

%% =======================================================definitions====================================================
% \newcounter{subyear}
% \setcounter{subyear}{\number\year}
% \def\submitted#1{\gdef\@submitted{#1}}
% \def\@submittedyear{\ifnum\month>10 \stepcounter{subyear}\thesubyear
%   \else\thesubyear\fi}
% \def\@submittedmonth{\ifnum\month>10 January\else\ifnum\month>5 November
%   \else June\fi\fi}
% \def\copyrightyear#1{\gdef\@copyrightyear{#1}}
% \def\@copyrightyear{\number\year}

% \def\adviser#1{\gdef\@adviser{#1}}
% \def\@submitted{\@submittedmonth~\@submittedyear}
% \def\@dept{Mathematics}
% \def\@deptpref{Department of}
% \def\departmentprefix#1{\gdef\@deptpref{#1}}
% \def\department#1{\gdef\@dept{#1}}

\long\def\abstract#1{\gdef\@abstract{#1}}
\long\def\@abstract{\@latex@error{No \noexpand\abstract given}\@ehc}
\long\def\acknowledgements#1{\gdef\@acknowledgements{#1}}
\def\dedication#1{\gdef\@dedication{#1}}

%% highlight notes for future edits to the thesis
\newcommand{\todo}[1]{\textbf{\emph{TODO:}#1}} 

\newcommand*{\bodyspacing}{
  \doublespacing
} % Setup a command to set spacing for body text; also used to restore spacing after long tables in document
\newcommand*{\tablespacing}{
  \singlespacing
} % Setup a command to set spacing for long tables, to be used manually in document
\newcommand*{\extravspace}[1]{ \vspace{0in} } % Setup a command to add extra space only if in singlespacing mode

\newcommand*{\frontmatter}{ \pagenumbering{roman} }
\newcommand*{\mainmatter}{ \pagenumbering{arabic} }

%% ======================================================environments===================================================
%% create an environment that will indent text (see: http://latex.computersci.org/Reference/ListEnvironments)
\newenvironment{indenttext}{
    \begin{list}{}{ \itemsep 0in \itemindent 0in
    \labelsep 0in \labelwidth 0in
    \listparindent 0in
    \topsep 0in \partopsep 0in \parskip 0in \parsep 0in
    \leftmargin 1em \rightmargin 0in
    \raggedright % \raggedright makes them left aligned instead of justified
    }
    \item
  }
  {\end{list}}

%% another environment that's an indented list, with no spaces between items -- if we want multiple items/lines. 
%% Useful in tables. Use \item inside the environment.
\newenvironment{indentlist}{
    \begin{list}{}{ \itemsep 0in \itemindent 0in
    \labelsep 0in \labelwidth 0in
    \listparindent 0in
    \topsep 0in \partopsep 0in \parskip 0in \parsep 0in
    \leftmargin 1em \rightmargin 0in
    \raggedright
    }

  }
  {\end{list}}

%% ====================================================new commands "make"==============================================
%\newcommand{\makecoverpage}{{
%  \thispagestyle{empty}
%  \sc
%  \vspace*{0in}
%  \begin{center}
%    \LARGE \@title
%  \end{center}
%  \vspace{.6in}
%  \extravspace{.6in}
%  \begin{center}
%    \@author
%  \end{center}
%  \vspace{.6in}
%  \extravspace{.6in}
%  \begin{center}
%    A Dissertation \\
%    Presented to the Faculty \\
%    of Princeton University \\
%    in Candidacy for the Degree \\
%    of Doctor of Philosophy
%  \end{center}
%  \vspace{.3in}
%  \extravspace{.3in}
%  \begin{center}
%    Recommended for Acceptance \\
%    by the \@deptpref \\
%    \@dept \\
%    Adviser: \@adviser
%  \end{center}
%  \vspace{.3in}
%  \extravspace{.3in}
%  \begin{center}
%    \@submitted
%  \end{center}
%  \clearpage
%  }}
\newcommand{\makecoverpage}{
   \includepdf[pages={1}]{CoverNApproval} 
  }

%\newcommand*{\makecopyrightpage}{
%  \thispagestyle{empty}
%  \vspace*{0in}
%  \begin{center}
%    \copyright\ Copyright by \@author, \@copyrightyear. \\
%    All rights reserved.
%  \end{center}
%  \clearpage}
\newcommand*{\makecopyrightpage}{
  \thispagestyle{empty}
  \todo {make copyright page here}
  \clearpage
}

\newcommand{\makeapprovalpage}{
   \includepdf[pages={2}]{CoverNApproval} 
}

\newcommand*{\makeabstract}{
  \newpage
  \addcontentsline{toc}{chapter}{Abstract}
  \begin{center}
    \Large \textbf{Abstract}
  \end{center}
  \@abstract
  \clearpage
}

\def\makededication{
  \ifx\@dedication\undefined
  \else
    \addcontentsline{toc}{chapter}{Dedication}
    \vspace*{1.5in}
    \begin{flushright}
      \@dedication
    \end{flushright}
    \clearpage
  \fi
 }
 
\def\makeacknowledgements{
  \ifx\@acknowledgements\undefined
  \else
    \ifdefined\phantomsection
     %% makes hyperref recognize this section properly for pdf links
     \phantomsection
    \else
    \fi

    \addcontentsline{toc}{chapter}{Acknowledgements}
    \begin{center}
      \Large \textbf{Acknowledgements}
    \end{center}
    \@acknowledgements
    \clearpage
  \fi
 }

\newcommand*{\maketoc}{
  %% Add ToC to the pdfbookmarks as a section, but not to the ToC itself.
  %% only if we have the hyperref command that is necessary
  \ifdefined\pdfbookmark
     \phantomsection
     \pdfbookmark[1]{\contentsname}{Contents}
  \else
  \fi

  \tableofcontents
  \clearpage
}

\newcommand*{\makelot}{}
\newcommand*{\makelof}{}
\newcommand*{\makeglo}{}
% \newcommand*{\makelos}{}


\newcommand*{\makefrontmatter}{
  \bodyspacing
  \frontmatter
  \makecoverpage 
  \makeapprovalpage
  \makecopyrightpage
  \makeabstract
  \makededication
  \makeacknowledgements  
  \maketoc
  \makelot\clearpage
  \makelof\clearpage
  \makeglo\clearpage
  % \makelos\clearpage
  \mainmatter
}

%% ======================================================declare options================================================
\DeclareOption{lot}{\renewcommand*{\makelot}{
  \ifdefined\phantomsection
    %% makes hyperref recognize this section properly for pdf links
    \phantomsection
  \else
  \fi
  \addcontentsline{toc}{chapter}{List of Tables}\listoftables}
}
  
\DeclareOption{lof}{\renewcommand*{\makelof}{
  \ifdefined\phantomsection
    %% makes hyperref recognize this section properly for pdf links
    \phantomsection
  \else
  \fi
  \addcontentsline{toc}{chapter}{List of Figures}\listoffigures}
}
  
% \DeclareOption{los}{\renewcommand*{\makelos}{
%   \RequirePackage{losymbol}
%   \section*{List of Symbols\@mkboth {LIST OF SYMBOLS}{LIST OF SYMBOLS}}
%   \@starttoc{los}
%   \ifdefined\phantomsection
%     %% makes hyperref recognize this section properly for pdf links
%     \phantomsection
%   \else
%   \fi
%   \addcontentsline{toc}{chapter}{List of Symbols}
%   }
% }

\DeclareOption{glossary}{\renewcommand*{\makeglo}{
  \ifdefined\phantomsection
    %% makes hyperref recognize this section properly for pdf links
    \phantomsection
  \else
  \fi
  \addcontentsline{toc}{chapter}{Acronyms}\printglossary[type=\acronymtype]\clearpage
  \addcontentsline{toc}{chapter}{Glossary}\printglossary}
}

\DeclareOption{singlespace}{
  \renewcommand*{\bodyspacing}{
  \singlespacing
  }
  \renewcommand*{\extravspace}[1]{\vspace{#1}} % Add extra space only if in singlespacing mode
}

%% Doublespacing is the default for the thesis -- need not be declared.
\DeclareOption{doublespacing}{
  \renewcommand*{\bodyspacing}{
  \doublespacing
  }
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

\ProcessOptions


\endinput

