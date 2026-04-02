\LoadClass[10pt,a4paper]{article}



\RequirePackage{lineno} 		% For linenumbers 
\RequirePackage{calc} 			% For length calculations
%\RequirePackage[osf,sc]{mathpazo} 		% For Palatino font type
\RequirePackage{times} % Add this line for Times New Roman font
\RequirePackage{courier} 		% Courier as monospace font
\RequirePackage{indentfirst} 	% For paragraph indentation
\RequirePackage{changepage} 	% Ensure narrow margins in abstract
\RequirePackage{titlesec}		% For section headers
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}  % For color settings

%\definecolor{lightgray}{RGB}{230,230,230}
%\definecolor{lightgray}{gray}{0.95}	% New color for shaded tables
\setlength{\parindent}{0.2in}	% Paragraph indentation is 0.2pt

%% CRITICAL: Add stretchability to parskip for flushbottom to work
\setlength{\parskip}{0pt plus 1pt}

%% -------
%% OPTIONS
%% -------
%% jgea.cls is based on the standard article.cls. However only a small subset of
%% the article class options must be made available to the user to maintain the precise
%% formatting of the template.
%%
%% Define jgea specific class options here:
%% Options supported by jgea.cls:
%% 		'draft' 	  : Include figures as plain bounding boxes only, indicate
%% 						overflown lines with black filled boxes on the margin. Allows
%%						faster compilation and is useful for debugging.
%% 		'linenumbers' : Print line numbers on left margin.
%% 		'showframe'   : Display a frame on each page indicating the margins. Useful
%%						for identifying overflown text and floats.
%%
%% ! Please use jgea WITHOUT ANY OPTIONS for FINAL submission !
%%

% Allow only a small subset of article class/package options:
\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{article}} % Faster compilation
\DeclareOption{linenumbers}{\linenumbers} % For line numbers
\DeclareOption{showframe}{\PassOptionsToPackage{\CurrentOption}{geometry}} % For margins

% Any option other than above will generate an error:
\DeclareOption*{\OptionNotUsed
	\ClassError{jgea}
	{Option '\CurrentOption' is not available for the \jgea@shortname\space class}
	{Remove option '\CurrentOption' and try again}}
\ProcessOptions\relax

%% -------------------------------------------
%% VOLUME, YEAR, ISSUE NO, ARTICLE NO, PAGE NO
%% -------------------------------------------
%% Volume number. Latex gives a warning if this information is not inputed.
\def\volume#1{\gdef\@volume{#1}}
\gdef\@volume{\@latex@warning@no@line{No \noexpand\volume given}}

%% Publication year. Latex gives a warning if this information is not inputed.
\def\pubyear#1{\gdef\@pubyear{#1}}
\def\@pubyear{\@latex@warning@no@line{No \noexpand\pubyear given}}

%% Issue number. Latex gives a warning if this information is not inputed.
\def\issueno#1{\gdef\@issueno{#1}}
\gdef\@issueno{\@latex@warning@no@line{No \noexpand\issueno given}}

%% Article number. Latex gives a warning if this information is not inputed.
\def\articleno#1{\gdef\@articleno{#1}}
\gdef\@articleno{\@latex@warning@no@line{No \noexpand\articleno given}}

%% Page number. Latex gives a warning if this information is not inputed.
\def\pagerange#1#2{\gdef\@firstpage{#1} \gdef\@lastpage{#2}}
\gdef\@firstpage{\@latex@warning@no@line{No \noexpand\pagerange given}}
\gdef\@lastpage{\@latex@warning@no@line{No \noexpand\pagerange given}}

%% ------
%% HEADER
%% ------
\RequirePackage{fancyhdr} 	% Customize pagestyle, header, title
\pagestyle{fancy} 			% Customize pagestyle, header, title
\lhead{}					% For left header
\rhead{}					% For right header
\renewcommand*{\headrulewidth}{0pt} % I remove the horizontal line above the header!
% Header Palatino 10 pt, italic, with volume, year, issue, article, page info.
%\chead{\small\selectfont{\itshape Journal of Global Economic Analysis}, Volume \@volume \space (\@pubyear), No. \@issueno, Article \@articleno, pp. \@firstpage -\@lastpage.} % with article number in the header

%%ejb (Turn the header off)
%\chead{\small\selectfont{\itshape Journal of Global Economic Analysis}, Volume \@volume \space (\@pubyear), No. \@issueno, pp. \@firstpage -\@lastpage.} % without article number in the header

%% ----------
%% TITLE PAGE
%% ----------
% Define title format here. Palatino 22pt, centered. 0 pt before 12 pt after paragraph spacing.
% Define author format here. Palatino 11 pt, centered. 0 pt before 18 pt after paragraph spacing. Author footnotes are numbered by a,b..

\renewcommand*\maketitle{
    {
        \thispagestyle{fancy}
        \def\thefootnote{\alph{footnote}}% author footnote style
        \setlength{\parskip}{0pt}
        \setlength{\parindent}{0pt}
        \null \vspace{-29.5pt}% by trial and error
        \begin{center}
            {\fontsize{22}{30.8}\selectfont\@title\par}% title style
            \vspace{25pt}% by trial and error
            {\fontsize{11}{13.2}\selectfont\scshape \space}% author style
            {\fontsize{11}{13.2}\selectfont\scshape\@author\par}% author style
            {\fontsize{11}{13.2}\selectfont\scshape\@version\par}% author style
            \vskip 21pt % by trial and error
        \end{center}
        \setlength{\footnotesep}{\baselineskip} % Adjust the separation between footnotes
        %\setlength{\skip\footins}{5pt} % Set space above footnote separator
        %\setlength{\footnotemargin}{-0.2em} % Adjust the space between the word and footnote number
        \renewcommand{\footnoterule}{\kern -3pt} % Adjust the rule above footnotes
        \raggedright % Justify alignment for footnotes
        \setcounter{footnote}{0}%
        \global\let\thanks\relax
        \global\let\maketitle\relax
        \global\let\@thanks\@empty
        \global\let\@author\@empty
        \global\let\@version\@empty
        \global\let\@date\@empty
        \global\let\@title\@empty
        \global\let\title\relax
        \global\let\author\relax
        \global\let\version\relax
        \global\let\and\relax
    }
}

\def\@affiliation\relax
\def\@affiliation#1#2{\gdef\textsuperscript{#1}\space#2}


%% -----------------------------
%% ABSTRACT, KEYWORDS, JEL CODES
%% -----------------------------
% Define abstract environment here. Palatino 11 pt, italic, right and left indentation 0.2in, second paragraph indentation 0.2in, 12 pt after paragraph spacing. 
\renewenvironment{abstract}{\begin{adjustwidth}{0.2in}{0.2in}\noindent \itshape\ignorespaces}{\end{adjustwidth}\vspace{9pt}}

% Define jel code environment here. Palatino 10 pt, right and left indentation 0.2in, 12 pt after paragraph spacing.
\newenvironment{jelcodes}{\begin{adjustwidth}{0.2in}{0.2in}\noindent\small JEL codes:}{\end{adjustwidth}\vspace{9pt}}

% Define keywords environment here. Palatino 10 pt, right and left indentation 0.2in, 12 pt after paragraph spacing.
\newenvironment{keywords}{\begin{adjustwidth}{0.2in}{0.2in}\noindent\small Keywords:}{\end{adjustwidth}\vspace{0pt}}

\newenvironment{version}{\begin{adjustwidth}{0.2in}{0.2in}\noindent\small}{\end{adjustwidth}\vspace{9pt}}
%% ----------------
%% SECTION HEADINGS
%% ----------------


% Define second level heading here. Palatino 11 pt, italic.

\titleformat*{\section}{\Large\bfseries}
\titleformat*{\subsection}{\large\bfseries}
\titleformat*{\subsubsection}{\normalsize\bfseries}
%\titleformat{\subsubsection}{}{\thesubsubsection}{\itshape}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define first level heading here. Palatino 11 pt.
%\titleformat{\section}[block]
%{\normalfont\normalsize\bfseries}{\thesection.}{0.25em}{}

%\titleformat{\subsection}[block]
%{\normalfont\normalsize\bfseries{\thesubsection}}{0.25em}{}

% Define first level heading here. Palatino 11 pt.
%\titleformat{\subsubsection}[block]
%{\normalfont\normalsize\bfseries}{\thesubsubsection}{0.25em}{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% CRITICAL: Add significant flexibility to section spacing
\titlespacing{\section} {0pt}{12pt plus 6pt minus 4pt}{7pt plus 4pt minus 2pt}
\titlespacing{\subsection} {0pt}{6pt plus 4pt minus 3pt}{7pt plus 4pt minus 2pt}
\titlespacing{\subsubsection}{2pt}{6pt plus 4pt minus 3pt}{7pt plus 4pt minus 2pt}

\let\paragraph\relax	% Fourth level and above headings are not allowed.
\let\subparagraph\relax	% Fourth level and above headings are not allowed.


%% --------------
%% FOOTNOTE STYLE
%% --------------
% Define footnote format here. Palatino, 10 pt with numeric labels.
\def\footnote@style{\normalfont\normalsize\selectfont}
\def\thefootnote{\arabic{footnote}}%
\def\@makefnmark{{\footnote@style\textsuperscript{\thefootnote}}}%
\long\def\@makefntext#1{\footnote@style\noindent\@makefnmark\ #1}%
\renewcommand{\footnoterule}{%
	\kern -3pt % increasing it moves up or down the footnote
	\hrule width 1in height 1pt % size of the rule above the footnote
	\kern 6pt % moves the footnote down
}
\setlength{\skip\footins}{0.5cm plus 4pt minus 2pt} % Added flexibility
\usepackage[hang,flushmargin]{footmisc}
\setlength{\footnotemargin}{0.9em}%% Adjust the space between the footnote and the numbers in the footnote section

\makeatletter
\long\def\@makefnmark{%
  \hbox{\@textsuperscript{\normalfont\bfseries\@thefnmark}\hspace{0.05em}}% Edits how footnote numbers appear in the literature
}
\makeatother


%% EQUATIONS
%% ---------
% Define equations here. Palatino, 11 pt, centered, right-numbered, 6 pt before and after paragraph spacing.
\RequirePackage[reqno]{amsmath}

% 6pt spacing before and after the equations

%Find this in the body after begin doc.


%% -----------
%% LIST STYLES
%% -----------
% Define list stylesh here. Palatino 11 pt, left indent 0.3in, hanging 0.25in, 6pt before and after spacing.
\RequirePackage[shortlabels]{enumitem} % Customize listings
% left indent 0.3in + hanging 0.25in. Hanging by trial and error
\setlist[itemize,1]{leftmargin=*,labelindent=0.3in,labelsep=0.15in} 
\setlist[enumerate,1]{label={\arabic*.},leftmargin=*,labelindent=0.3in,labelsep=0.15in} 
\setlist{itemsep=-4pt, topsep=6pt} % 6pt before paragraph spacing and singlespacing between items


%% -------------
%% CODE EXTRACTS
%% -------------
%% This template uses the listing style "jgea" defined in jgea.cls. 
%% The listings environment is customized in the jgea.cls file for code extracts with %% default jgea style. Additional customizations, e.g. language selection, syntax
%% highlighting, can be done in document preable using \lstset \lstdefinestyle commands
%% as described in package documentation: 
%% http://ctan.sharelatex.com/tex-archive/macros/latex/contrib/listings/listings.pdf
%%
% Define code extract style here. Courier 8pt, single spaced, 0.2in indentation, 6pt before and after paragraph spacing. 
\RequirePackage{listings} % For listings, code extracts.

% Define listing style for short code snippets here.
\lstdefinestyle{shortcode}%
{
	basicstyle       =\color{black}\ttfamily\scriptsize, % Courier 8pt, black
	breaklines       = true, 		% Break long lines 
	aboveskip        = 6pt,			% 6pt before paragraph spacing
	belowskip        = 6pt,			% 6pt after paragraph spacing
	xleftmargin      = 0in,		% 0.2in left indentation
	xrightmargin     = 0in,			% No right indentation
	breakindent      = 0pt,			% Indentation break
	columns          = flexible,	% For columns
	showstringspaces = false,  		% Don't show space characters
	showtabs  		 = false,		% Don't show tab characters
	sensitive 		 = false,		% Case sensitivity
}

% Define listing style for long code here.
\lstdefinestyle{longcode}%
{
	basicstyle       =\color{black}\ttfamily\scriptsize, % Courier 8pt, black
	breaklines       = true, 		% Break long lines 
	aboveskip        = 6pt,			% 6pt before paragraph spacing
	belowskip        = 6pt,			% 6pt after paragraph spacing
	xleftmargin      = 0in,		% 0.2in left indentation
	xrightmargin     = 0in,			% No right indentation
	breakindent      = 0pt,			% Indentation break
	columns          = flexible,	% For columns
	showstringspaces = false,  		% Don't show space characters
	showtabs  		 = false,		% Don't show tab characters
	sensitive 		 = false,		% Case sensitivity
	framerule		 = 0.5pt,		% Frame thickness
	frame			 = tb,			% Add top and bottom rules
	numbers			 = left,		% Add line numbers
	numberstyle	 	 = \color{black}\ttfamily\tiny,	% Number style
	numberblanklines = false,		
}

% Set lstlisting environment defaults
\lstset{style=shortcode}

%% --------------------------------------------------------
%% FLOATS: 1.TABLES, 2.FIGURES, 3. FLOAT CAPTIONS and NOTES
%% --------------------------------------------------------
%% CRITICAL: Flexible float spacing for proper page filling
\setlength{\textfloatsep}{12pt plus 12pt minus 4pt}
\setlength{\intextsep}{12pt plus 8pt minus 4pt}
\setlength{\floatsep}{12pt plus 8pt minus 4pt}

%% --------
%% 1.TABLES 
%% --------
% Define table format here. Text in table Palatino 10pt. Horizontal lines in tables are 0.5pt.
\RequirePackage{booktabs} 			% For enhancing the table quality
% Top rule, bottom rule, mid rule
\setlength\heavyrulewidth{0.5pt}	% Rule width 0.5pt
\setlength\lightrulewidth{0.5pt}	% Rule width 0.5pt
\setlength\cmidrulewidth{0.5pt}		% Rule width 0.5pt

% Convenience commands for column alignment: Enable simultaneous specification of justification and column width in tabular e.g. L{0.5in} results in a left justified column 0.5 inches wide.
\RequirePackage{array}		% For \newcolumntype
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
%% --------
%% Table Column Type
%% --------
\newcolumntype{d}{D{.}{.}{-1}}


%% ---------
%% 2.FIGURES
%% ---------
% Define figure format here. This is taken care of by the graphicx package. Figures are included in the template by the minipage environment.
\RequirePackage{graphicx} 	% Enable figure inclusion with \includegraphics
\DeclareGraphicsExtensions{.png,.pdf,.jpg} % Look for these extensions in order
\renewcommand{\figurename}{Figure}

%% --------------------------
%% 3.FLOAT CAPTIONS and NOTES
%% --------------------------
% Define float caption format here. 
\RequirePackage{caption}	% For float captions



% Define Table caption format here. Palatino 10pt, bold, centered, 6pt before and 2pt after paragraph spacing.

\captionsetup[table]{labelfont=bf,labelsep=period,font=normalsize, justification= justified,position=top, aboveskip=2pt,belowskip=6pt,list=no}


% Define Figure caption format here. Palatino 10pt, bold, centered, 6pt before and 6pt after paragraph spacing.
\captionsetup[figure]{labelfont=bf,labelsep=period,font=normalsize,justification=centering, aboveskip=0pt,belowskip=7pt,list=no}
% Define Listings caption format here. Palatino 10pt, bold, centered, 6pt before and 2pt after paragraph spacing.
\captionsetup[lstlisting]{labelfont=bf,labelsep=period,font=normalsize,justification=centering, aboveskip=6pt,belowskip=2pt,list=no}

% Define float notes and sources here. Notes and sources in Palatino 9pt, 0 pt before and 6pt after paragraph spacing.
\newcommand\floatnote[1]{\par\footnotesize\raggedright\textit{Notes:}\space#1\par\vspace*{6pt}}
\newcommand\floatsource[1]{\par\footnotesize\raggedright\textit{Source:}\space#1\par\vspace*{6pt}}

%% ----------
%% REFERENCES
%% ----------
% Define citation and reference format here. JGEA template uses jgea.bst bibliography style and natbib for references.
\RequirePackage{natbib}		% Use natbib for references

%% Define the hyperlinks and include url and doi in references.
%% This part from Dominique van der Mensbrugghe 05/12/16.

\RequirePackage{url}		% For url in references
\RequirePackage{hyperref}	% For hyperlink reference
\RequirePackage{doi}		% For doi in references
\RequirePackage{breakurl} 	% Keep url within margins

\definecolor{URLBlue}{rgb}{0.0, 0.06, 0.54} % \definecolor{oxfordblue}{rgb}{0.0, 0.13, 0.28}\definecolor{phthaloblue}{rgb}{0.0, 0.06, 0.54}
\hypersetup{
	colorlinks   = true,	
	citecolor    = URLBlue,
	linkcolor    = URLBlue,
	urlcolor     = URLBlue
}
\urlstyle{same} 			% Use same font type and size for url as the text.
\setlength{\bibsep}{3 pt} 	% Add space between bib entries.
\setlength{\bibhang}{0.2 in}	% 0.2in hanging indentation in bibliography

\makeatletter
%% Space between the double slash at the beginning of url address is too wide. The following reduces that space. 
\let\UrlSpecialsOld\UrlSpecials
\def\UrlSpecials{\UrlSpecialsOld\do\/{\Url@slash}\do\_{\Url@underscore}}%
\def\Url@slash{\@ifnextchar/{\kern-.11em\mathchar47\kern-.2em}%
	{\kern-.0em\mathchar47\kern-.08em\penalty\UrlBigBreakPenalty}}
\def\Url@underscore{\nfss@text{\leavevmode \kern.06em\vbox{\hrule\@width.3em}}}
\makeatother


%% ----------------
%% ACKNOWLEDGEMENTS
%% ----------------
% Define acknowledgement format here. Uses first level heading.
\newenvironment{acknowledgements}{\section*{Acknowledgements}}{}

%% -----------------------
%% APPENDIX and appendixes
%% -----------------------
\RequirePackage[titletoc, title]{appendix} % For customized appendices
\RequirePackage{chngcntr} % Separate numbering for equations, tables, figures in appendix
\usepackage{titlesec}
%% (1) Single Appendix (commented out as not needed for A-Z)
%\let\originalappendix\appendix
%\let\appendix\relax
%\newenvironment{appendix}{%
%    % Generate page breaks after each Appendix section
%    % Format Appendix titles, including the Appendix name in the title.
%    \titleformat{\section}[block]{\normalfont\Large\bfseries}{\appendixname~A.}{0.5ex}{}
%    % Number equations, figures and tables within each appendix separately
%    \counterwithin{equation}{section}
%    \counterwithin{figure}{section}
%    \counterwithin{table}{section}
%    \counterwithin{lstlisting}{section}
%    % Also redefine labels in Appendix to have the prefix, like A.1
%    \renewcommand\theequation{A.\arabic{equation}}
%    \renewcommand\thefigure{A.\arabic{figure}}
%    \renewcommand\thetable{A.\arabic{table}}
%    \renewcommand\thelstlisting{A.\arabic{lstlisting}}
%    % Customize subsections for single appendix: A-1 format
%    \renewcommand{\thesubsection}{A-\arabic{subsection}}
%    \titleformat{\subsection}[block]{\normalfont\normalsize\bfseries}{\thesubsection.}{0.5ex}{}
%}


%% (2) Multiple Appendices (Robust Version with Per-Section Resets)
\RequirePackage{chngcntr} % Ensure loaded for \counterwithin
\RequirePackage{etoolbox} % For patching commands
\let\originalappendices\appendices % Save original after package load
\def\appendices{%
    % Reset section counter at start of appendices to begin with A
    \setcounter{section}{0}
    % Format Appendix titles
    \titleformat{\section}[block]{\normalfont\Large\bfseries}{\appendixname~\Alph{section}.}{0.5ex}{}
    % Link counters to section (adds section prefix and resets subcounter at each \section)
    \counterwithin{equation}{section}
    \counterwithin{figure}{section}
    \counterwithin{table}{section}
    \counterwithin{lstlisting}{section}
    % Redefine numbering with prefix (global)
    \renewcommand\theequation{\Alph{section}.\arabic{equation}}
    \renewcommand\thefigure{\Alph{section}.\arabic{figure}}
    \renewcommand\figurename{Fig.} % Abbreviate in appendices only
    \renewcommand\thetable{\Alph{section}.\arabic{table}}
    \renewcommand\thelstlisting{\Alph{section}.\arabic{lstlisting}}
    % Subsection formatting
    \renewcommand{\thesubsection}{\Alph{section}.\arabic{subsection}}
    \titleformat{\subsection}[block]{\normalfont\normalsize\bfseries}{\thesubsection.}{0.5ex}{}
    % Patch \section to force reset of figure/table counters at each appendix section start
    \makeatletter
    \patchcmd{\section}{\addcontentsline}{\setcounter{figure}{0}\setcounter{table}{0}\setcounter{equation}{0}\addcontentsline}{}{}
    \makeatother
    % Initial reset for first appendix
    %\setcounter{figure}{0}
    %\setcounter{table}{0}
    %\setcounter{equation}{0}
    % Call original
    \originalappendices
}




%% ------------------------------------------------------------------------------------------
%% PAGE LAYOUT AND SPACING - CRITICAL FOR CONSISTENT BOTTOM MARGINS
%% ------------------------------------------------------------------------------------------

%% CRITICAL: Equation spacing with significant flexibility
\setlength{\abovedisplayskip}{6pt plus 4pt minus 4pt}
\setlength{\belowdisplayskip}{6pt plus 4pt minus 4pt}
\setlength{\abovedisplayshortskip}{0pt plus 4pt}
\setlength{\belowdisplayshortskip}{4pt plus 4pt minus 2pt}

%% USE FLUSHBOTTOM for consistent page bottoms
%% This forces LaTeX to fill pages to the bottom margin
\flushbottom

%% CRITICAL: Baselineskip flexibility for flushbottom
\lineskip=1pt plus 0.5pt
\lineskiplimit=2pt
\normallineskip=1pt plus 0.5pt

%% Page breaking penalties - prevent widows/orphans while allowing good breaks
\widowpenalty=10000      % Prevent widow lines (single line at top of page)
\clubpenalty=10000       % Prevent orphan lines (single line at bottom of page)
\brokenpenalty=4991      % Penalty for page break after hyphenated line
\predisplaypenalty=10000 % Penalty for breaking before a display equation
\postdisplaypenalty=1549 % Penalty for breaking after a display equation
\displaywidowpenalty=1602% Penalty for breaking before last line before display

%% CRITICAL: Aggressive float placement to prevent large gaps
%% Maximum fraction of page that can be floats at TOP of page
\renewcommand{\topfraction}{0.9}

%% Maximum fraction of page that can be floats at BOTTOM of page
\renewcommand{\bottomfraction}{0.8}

%% Minimum fraction of page that must be TEXT (not floats) - REDUCED
\renewcommand{\textfraction}{0.1}

%% Minimum fraction of float page that must be floats
\renewcommand{\floatpagefraction}{0.8}

%% Double column versions (if needed)
\renewcommand{\dbltopfraction}{0.9}
\renewcommand{\dblfloatpagefraction}{0.8}

%% Maximum number of floats per page - INCREASED
\setcounter{topnumber}{4}
\setcounter{bottomnumber}{3}
\setcounter{totalnumber}{6}
\setcounter{dbltopnumber}{4}

%% Keep footnotes together on one page
\interfootnotelinepenalty=10000

%% CRITICAL: Allow more flexibility in page filling
\tolerance=1500           % Allow looser line breaking
\hbadness=3000           % Suppress some underfull hbox warnings
\vbadness=3000           % Suppress some underfull vbox warnings
\emergencystretch=1.5em  % Extra stretch in emergencies

%% CRITICAL: Reduce float penalties to allow more flexible placement
\makeatletter
\setlength{\@fptop}{0pt plus 1fil}    % Space at top of float page
\setlength{\@fpsep}{10pt plus 2fil}   % Space between floats on float page
\setlength{\@fpbot}{0pt plus 1fil}    % Space at bottom of float page
\makeatother

%% Allow display breaks within align environments
\allowdisplaybreaks[2]

\usepackage{xcolor}
\usepackage{textcomp}
\usepackage{threeparttable}
\usepackage{threeparttablex} % Add to preamble
\usepackage{adjustbox}
\usepackage{changepage}
\usepackage{ltablex}
\usepackage{booktabs} % For professional table rules/formatting (toprule, midrule, bottomrule)
\usepackage{caption}
\usepackage{placeins}
\usepackage{amssymb} % For \mathbb{1} indicator function
\usepackage{subcaption}
\usepackage{fancyvrb}
\usepackage{array}
\usepackage{lscape}
\usepackage{makecell}
\usepackage{cellspace}
\usepackage[]{hyperref}
\usepackage{tikz}
\usepackage{rotating}
\usepackage{tablefootnote}
% Add these to your document preamble if not already present
\usepackage{dcolumn} % For decimal-aligned columns
\usepackage{float} % For the [H] placement option
%\usepackage{footnotebackref}
%\usepackage{afterpage}
%\usepackage{url}
%\usepackage{comment}
\usepackage{ragged2e}
\usepackage{multirow}
\usepackage{tikzscale}
\usepackage{tabularx}
\usepackage{pgfplotstable}
\usepackage{longtable}
\usepackage{pgfplots}
\usepackage{helvet}
\usepackage[eulergreek]{sansmath}
\usepackage{graphicx}
\usepackage{pdflscape}
%\usepackage{lipsum} % Just for dummy text, remove in your final document
\usepackage{fancyhdr}
\usepackage{natbib}
\usepackage{amsmath}
\usepackage{titlesec}
\usepackage{geometry}
\usepackage{bookmark}

% Geometry setup
\geometry{a4paper, height=9in, width=6in, left=1in, right=1in, top=0.75in, bottom=0.75in}

% Page style
\pagestyle{fancy}
\fancyfoot{}
\fancyhf{}
\fancyfoot[C]{\makebox[\textwidth][c]{\thepage}}
%\fancyhead[C]{\centering\textcolor{red}{\small This is a work in progress and hence should not be cited or circulated without the author's approval.}}
%\renewcommand{\headrulewidth}{0pt} % Remove the header rule
%\renewcommand{\footrulewidth}{0pt} % Remove the footer rule
% Float placement tweaks
%\renewcommand{\floatpagefraction}{0.8}
%\renewcommand{\topfraction}{0.8}
%% ---------------
%% End of jgea.cls
%% ---------------