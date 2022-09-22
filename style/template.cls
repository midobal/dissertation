\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{phdtemplate}[Ph.D. template based on the template by Editorial de la Universitat Politecnica de Valencia]
\LoadClass[10pt]{book}

% ------------------------------------------------------

\RequirePackage{ifthen}
\RequirePackage{apptools}

% ------------------------------------------------------


\newboolean{CROP}\setboolean{CROP}{false}

\newboolean{DistanciesEquacions}\setboolean{DistanciesEquacions}{true}

\newboolean{RM}\setboolean{RM}{false}
\newboolean{SF}\setboolean{SF}{false}

\newboolean{valencia}\setboolean{valencia}{false}
\newboolean{castellano}\setboolean{castellano}{false}
\newboolean{english}\setboolean{english}{false}


% ------------------------------------------------------

\DeclareOption{crop}{\setboolean{CROP}{true}}
\DeclareOption{nocrop}{\setboolean{CROP}{false}}

\DeclareOption{rm}{\setboolean{RM}{true}}
\DeclareOption{sf}{\setboolean{SF}{true}}

\DeclareOption{nomathskip}{\setboolean{DistanciesEquacions}{false}}

\DeclareOption{castellano}{
	\setboolean{castellano}{true}
	\setboolean{valencia}{false}
	\setboolean{english}{false}
}
\DeclareOption{valencia}{
	\setboolean{castellano}{false}
	\setboolean{valencia}{true}
	\setboolean{english}{false}
	}
\DeclareOption{english}{
	\setboolean{castellano}{false}
	\setboolean{valencia}{false}
	\setboolean{english}{true}
	}

% ------------------------------------------------------

\DeclareOption*{\ClassWarning{phdtemplate}{The option ?\CurrentOption? could not be processed.}}

% ------------------------------------------------------

\ExecuteOptions{rm,nocrop,castellano}
\ProcessOptions\relax


% ------------------------------------------------------

\RequirePackage{graphicx}
\RequirePackage{calc}

% ------------------------------------------------------


\renewcommand\maketitle{
  \begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \begin{center}%
  \vskip -80\p@
  {\includegraphics[width=9cm]{./logos/logo}}
  \vskip 15\p@
  {\LARGE \department}
  \vskip 10\p@
    \vskip 1.5em%
    {\huge\bfseries \@title \par}%
    \vskip 1.5em%
    {\large
     \lineskip .75em%
	  \vskip 20\p@     
      \begin{tabular}[t]{c}%
        \Large \@author
      \end{tabular}\par}%
	  \vskip 50\p@     
    {\large \@date \par}%       
  \vfil\null
  \end{center}\par
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

% ---------------------------------------------------------------------
% Font

	\renewcommand{\normalsize}{\fontsize{10.5pt}{12.5pt}\selectfont}


\ifSF
	\renewcommand{\familydefault}{\sfdefault}
\else
	\renewcommand{\familydefault}{\rmdefault}
\fi
	

% ---------------------------------------------------------------------
% Page format

\RequirePackage{geometry}

\newlength{\amplePublicacio}
\setlength{\amplePublicacio}{17cm}

\newlength{\alcadaPublicacio}
\setlength{\alcadaPublicacio}{24cm}

\newlength{\margeVerticalSuperior}
\setlength{\margeVerticalSuperior}{1.75cm}

\newlength{\margeVerticalInferior}
\setlength{\margeVerticalInferior}{1.75cm}

\newlength{\margeInterior}
\setlength{\margeInterior}{2.5cm}

\geometry{ 
	twoside,
	vmargin = {\margeVerticalSuperior, \margeVerticalInferior}, 
	includehead, includefoot,
	left = \margeInterior,
	headheight = 0.5cm,	
	headsep = 0.75cm,
	footskip = 1.25cm,
	textwidth = 13cm,
	paperwidth = \amplePublicacio, paperheight = \alcadaPublicacio,
	}

% --------------------------------------------
% Cutting lines

\ifCROP
	\usepackage[cam, a4, center, odd, noinfo]{crop}
\fi


% ---------------------------------------------------------------------
% Header and footer

\RequirePackage{fancyhdr}
\pagestyle{fancy}

\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}{}}

\fancyhead{}
\fancyfoot{}


\newlength{\myevenheadlinehoffset}
\newlength{\myevenheadtexthoffset}
\newlength{\myoddheadlinewidth}
\newlength{\myevenheadlinewidth}

\setlength{\myevenheadlinehoffset}{0.0cm}
\setlength{\myevenheadtexthoffset}{0.0cm}
\setlength{\myoddheadlinewidth}{\textwidth}
\setlength{\myevenheadlinewidth}{\textwidth}


\fancyhead[LE]{%
	\hspace*{\myevenheadlinehoffset}\makebox[0cm][l]{\rput[r](13.1,-0.3){\psvectorian[scale=0.825]{88}}}%
	\ifnum\value{chapter}>0 \hspace*{\myevenheadtexthoffset}{\small\itshape\nouppercase\@chapapp\ \thechapter.\ \leftmark} \fi
	\ifnum\value{chapter}<1 \hspace*{\myevenheadtexthoffset}{\small\itshape\nouppercase\leftmark} \fi
	%
	}
\fancyhead[LO]{%
	\hspace*{\myevenheadlinehoffset}\makebox[0cm][l]{\rput[r](13.1,-0.3){\psvectorian[scale=0.825]{88}}}%
	\ifnum\value{chapter}>0 \makebox[\textwidth][r]{\small\itshape\nouppercase\rightmark}  \fi%
	\ifnum\value{chapter}<1 \makebox[\textwidth][r]{\small\itshape\nouppercase\leftmark}  \fi%
	}
	
\fancyfoot[C]{\rput[c](-0.6,0.12){\psvectorian[scale=0.1]{55}} \thepage \rput[c](0.6,0.12){\psvectorian[scale=0.1]{56}}}%


% Footer for the first page

\fancypagestyle{plain}{% 
 \fancyhf{} % clear all header and footer fields 
	\fancyfoot[C]{\rput[c](-0.6,0.12){\psvectorian[scale=0.1]{55}} \thepage \rput[c](0.6,0.12){\psvectorian[scale=0.1]{56}}}%
	}

\renewcommand{\headrulewidth}{0.0pt}
\renewcommand{\footrulewidth}{0.0pt}



% ---------------------------------------------------------------------
% Layout

\setlength{\parskip}{2ex}
\setlength{\parindent}{0pt}

\newlength{\separaParrafos}
\setlength{\separaParrafos}{\parskip}
\newlength{\indentaParrafos}
\setlength{\indentaParrafos}{\parindent}

\linespread{1.0}

\setlength{\widowpenalty}{10000pt}
\setlength{\clubpenalty}{10000pt}

\raggedbottom


% ---------------------------------------------------------------------
% Improve captions

\RequirePackage{caption}
\renewcommand{\captionlabelfont}{\bfseries\small}
\renewcommand{\captionfont}{\small}

% ------------------------------------------------------------------------
% Sections format

\RequirePackage[
	raggedright,
	compact,
	nobottomtitles*,
	clearempty,
	]{titlesec}

% ------------------------------------------------------------------------

\titleformat{\part}
	[display]
	{\thispagestyle{empty}\filcenter
	\tolerance=10000\hyphenpenalty=10000}
	{\fontsize{18}{20}\bfseries\partname\enspace\thepart}
	{1pc}
	{\fontsize{24}{30}\bfseries}

% ------------------------------------------------------------------------

\titleformat{\chapter}
	[display]
	{\normalfont\large\filcenter}
	{\IfAppendix{\rput[c](-0.54,3.2){\psvectorian[scale=0.95]{122}}}{\rput[c](-0.54,3.2){\psvectorian[color=crown,scale=0.65]{68}}}\\ \TitleFont\vspace{-2.5cm}\raggedright\fontsize{52}{54}\IfAppendix{\fontsize{42}{44}\bfseries\enspace\chaptertitlename}{\lettrine[loversize=0.6]{C}{hapter}}\bfseries\enspace\thechapter}
	{2ex}
	{\TitleFont\vspace{-0.85cm}\raggedleft\fontsize{28}{31}\bfseries}
	[\IfAppendix{}{\vspace{2cm}}]


% ------------------------------------------------------------------------

\titleformat{\section}
	[hang]
	{\vspace{2ex}\raggedright\tolerance=10000\hyphenpenalty=10000}
	{\fontsize{14}{16}\bfseries\thesection}
	{1em}
	{\fontsize{14}{16}\bfseries}

% ------------------------------------------------------------------------

\titleformat{\subsection}
	[hang]
	{\vspace{1.5ex}\raggedright\tolerance=10000\hyphenpenalty=10000}
	{\fontsize{12}{14}\bfseries\thesubsection}
	{1em}
	{\fontsize{12}{14}\bfseries}
	[\vspace{-1ex}]


% ------------------------------------------------------------------------

\titleformat{\subsubsection}
	[hang]
	{\vspace{2ex}\raggedright\tolerance=10000\hyphenpenalty=10000}
	{\normalsize\bfseries\thesubsubsection}
	{1em}
	{\normalsize\bfseries}
	[\vspace{-0.75ex}]

% -------------------------------------------------------
% ToC

\setcounter{tocdepth}{2}

\RequirePackage[titles]{tocloft}

\renewcommand{\cftchapaftersnum}{}

\renewcommand{\cftsecfont}{\small}
\renewcommand{\cftsecpagefont}{\small}
\renewcommand{\cftsecaftersnum}{}
\renewcommand{\cftsubsecfont}{\small}
\renewcommand{\cftsubsecpagefont}{\small}

\renewcommand{\cftfigfont}{\small}
\renewcommand{\cftfigpagefont}{\small}

\renewcommand{\cfttabfont}{\small}
\renewcommand{\cfttabpagefont}{\small}

\renewcommand\cftchapafterpnum{\vskip7pt}
\renewcommand\cftsecafterpnum{\vskip5pt}
\renewcommand\cftsubsecafterpnum{\vskip5pt}

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------


\RequirePackage{enumitem}
\setlist[1]{partopsep=-1ex,parsep=\parskip,itemsep=0\parskip}
\setlist[2]{partopsep=-1ex,parsep=\parskip,itemsep=0\parskip}


\makeatletter
\let\ifes@LaTeXe\iftrue % htlatex Babel compatibility
\makeatother

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

\RequirePackage{mathtools}

\ifDistanciesEquacions
\AtBeginDocument
	{
	\abovedisplayshortskip = -1.0ex plus 0ex minus 0.25ex
	\belowdisplayshortskip = 2.0ex plus 1ex minus 0.0ex
	
	\abovedisplayskip = -1.0ex plus 0ex minus 0.25ex
	\belowdisplayskip = 2.0ex plus 1ex minus 0.0ex
	}
\fi

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
