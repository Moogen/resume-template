%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{resume-template}[2017/02/05 v1.6.1 Awesome Curriculum Vitae Class]
\NeedsTeXFormat{LaTeX2e}

%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
% Options for draft or final
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
% Inherit options of article
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}


%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
% Needed to make fixed length table
\RequirePackage{array}
% Needed to handle list environment
\RequirePackage{enumitem}
% Needed to handle text alignment
\RequirePackage{ragged2e}
% Needed to configure page layout
\RequirePackage{geometry}
% Needed to make header & footer effeciently
\RequirePackage{fancyhdr}
% Needed to manage colors
\RequirePackage{xcolor}
% Needed to use \ifxetex-\else-\fi statement
\RequirePackage{ifxetex}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
% Needed to use a toolbox of programming tools
\RequirePackage{etoolbox}
% Needed to change line spacing in specific environment
\RequirePackage{setspace}
% Needed to manage fonts
\RequirePackage[quiet]{fontspec}
% To support LaTeX quoting style
\defaultfontfeatures{Ligatures=TeX}
% Needed to manage math fonts
\RequirePackage{unicode-math}
% Needed to use icons from font-awesome
% (https://github.com/posquit0/latex-fontawesome)
\RequirePackage{fontawesome}
\RequirePackage[default,opentype]{sourcesanspro}
% Needed to deal a paragraphs
\RequirePackage{parskip}
% Needed to deal hyperlink
\RequirePackage[hidelinks,unicode]{hyperref}
\hypersetup{%
    pdftitle={},
    pdfauthor={},
    pdfsubject={},
    pdfkeywords={}
}
\usepackage{verbatim}


%-------------------------------------------------------------------------------
%                Configuration for directory locations
%-------------------------------------------------------------------------------
% Configure a directory location for fonts(default: 'fonts/')
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir

%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------
%% Page Layout
% Configure page margins with geometry
\geometry{left=2.0cm, top=1.5cm, right=2.0cm, bottom=2.0cm, footskip=.5cm}

%% Header & Footer
% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}

%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------
% Gray-scale colors
\definecolor{black}{HTML}{000000}

% Text colors
\colorlet{text}{black}

%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------
% Set font for header (default is Roboto)
\newfontfamily\headerfont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{Roboto}

\newfontfamily\headerfontlight[
  Path=\@fontdir,
  UprightFont=*-Thin,
  ItalicFont=*-ThinItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{Roboto}

\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesansprolight}

%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------
% Configure styles for each CV elements
% For fundamental structures
\newcommand*{\headernamestyle}[2]
    {{\fontsize{32pt}{1em}\headerfont\bfseries\color{text}#1\space#2}}
\newcommand*{\headeraddressstyle}[1]
    {{\fontsize{8pt}{1em}\headerfont\itshape\color{text} #1}}
\newcommand*{\headersocialstyle}[1]
    {{\fontsize{6.8pt}{1em}\headerfont\color{text} #1}}
\newcommand*{\sectionstyle}[1]
    {{\fontsize{16pt}{1em}\bodyfont\bfseries\color{text} #1}}

% For elements of entry
\newcommand*{\entrytitlestyle}[1]
    {{\fontsize{12pt}{1em}\bodyfont\bfseries\color{text} #1}}
\newcommand*{\entrypositionstyle}[1]
    {{\fontsize{10pt}{1em}\bodyfont\scshape\color{text} #1}}
\newcommand*{\entrydatestyle}[1]
    {{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{text} #1}}
\newcommand*{\entrylocationstyle}[1]
    {{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{text} #1}}
\newcommand*{\descriptionstyle}[1]
    {{\fontsize{10pt}{1em}\bodyfontlight\upshape\color{text} #1}}

% For elements of skill
\newcommand*{\skilltypestyle}[1]
    {{\fontsize{12pt}{1em}\bodyfont\bfseries\color{text} #1}}
\newcommand*{\skillsetstyle}[1]
    {{\fontsize{10pt}{1em}\bodyfontlight\color{text} #1}}

%-------------------------------------------------------------------------------
%                Commands for personal information
%-------------------------------------------------------------------------------
% Usage: \name{<firstname>}{<lastname>}
% Usage: \firstname{<firstname>}
% Usage: \lastname{<lastname>}
\newcommand*{\name}[2] {\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1] {\def\@firstname{#1}}
\newcommand*{\lastname}[1] {\def\@lastname{#1}}

% Usage: \address{<address>}
\newcommand*{\address}[1]{\def\@address{#1}}

% Usage: \mobile{<mobile number>}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}

% Usage: \email{<email address>}
\newcommand*{\email}[1]{\def\@email{#1}}

% Usage: \github{<github username>}
\newcommand*{\github}[1]{\def\@github{#1}}

% Usage: \linkedin{<linkedin link>}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}

%-------------------------------------------------------------------------------
%                Commands for extra
%-------------------------------------------------------------------------------
%% Define helper macros a user can change easily
% Header
\newcommand{\resumeHeaderNameDelim}{\space}
\newcommand{\resumeHeaderAfterNameSkip}{.4mm}
\newcommand{\resumeHeaderAfterPositionSkip}{.4mm}
\newcommand{\resumeHeaderAfterAddressSkip}{-.5mm}
\newcommand{\resumeHeaderIconSep}{\space}
\newcommand{\resumeHeaderSocialSep}{\quad\textbar\quad} % Used in between social links in the header
\newcommand{\resumeHeaderAfterSocialSkip}{6mm}

% Others
\newcommand{\resumeSectionTopSkip}{1mm} % TODO: make this smaller :)
\newcommand{\resumeSectionContentTopSkip}{1mm}

%-------------------------------------------------------------------------------
%                Commands for utilities
%-------------------------------------------------------------------------------
% Use to align an element of tabular table
\newcolumntype{L}[1]
    {>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}} m{#1}}
\newcolumntype{C}[1]
    {>{\centering\let\newline\\\arraybackslash\hspace{0pt}} m{#1}}
\newcolumntype{R}[1]
    {>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}} m{#1}}

% Use to draw horizontal line with specific thickness
\def\vhrulefill#1 {\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

% Use to execute conditional statements by checking empty string
\newcommand*{\ifempty}[3] {
    \ifthenelse{\isempty{#1}}
    {#2}
    {#3}
}

%-------------------------------------------------------------------------------
%                Commands for elements of CV structure
%-------------------------------------------------------------------------------
% Define a header for CV
% Usage: \makeresumeheader{L, C, R}. C by default
% If L, left justified
% If C, centered
% If R, right justified
\newcommand*{\makeresumeheader}[1][C]{
    \newlength{\headertextwidth}
    \setlength{\headertextwidth}{\textwidth}
  
    \begin{minipage}[c]{\headertextwidth}
        \ifthenelse{\equal{#1}{L}}
            {\raggedright}
            {\ifthenelse{\equal{#1}{R}}
                {\raggedleft}
                {\centering}}
        \headernamestyle{\@firstname}{\@lastname} \\ [\resumeHeaderAfterNameSkip]%
        \ifthenelse{\isundefined{\@address}}
            {}
            {\headeraddressstyle{\@address \\ [\resumeHeaderAfterAddressSkip]}}%
        \headersocialstyle{%
            \newbool{isstart}%
            \setbool{isstart}{true}%
            \ifthenelse{\isundefined{\@mobile}}%
                {}%
                {%
                    \faMobile\resumeHeaderIconSep\@mobile%
                    \setbool{isstart}{false}%
                }%
            \ifthenelse{\isundefined{\@email}}%
                {}%
                {%
                    \ifbool{isstart}{\setbool{isstart}{false}}{\resumeHeaderSocialSep}%
                    \href{mailto:\@email}{\faEnvelope\resumeHeaderIconSep\@email}%
                }%
            \ifthenelse{\isundefined{\@github}}%
                {}%
                {%
                    \ifbool{isstart}{\setbool{isstart}{false}}{\resumeHeaderSocialSep}%
                    \href{https://\@github}{\faGithubSquare\resumeHeaderIconSep\@github}%
                }%
            \ifthenelse{\isundefined{\@linkedin}}%
                {}%
                {%
                    \ifbool{isstart}{\setbool{isstart}{false}}{\resumeHeaderSocialSep}%
                    \href{https://\@linkedin}{\faLinkedinSquare\resumeHeaderIconSep\@linkedin}%
                }%
        } \\ [\resumeHeaderAfterSocialSkip]%
    \end{minipage}%
}

% Define a section for CV
% Usage: \makesectionheader{<section-title>}
\newcommand{\makesectionheader}[1] {%
    \vspace{\resumeSectionTopSkip}
    \sectionstyle{#1}
    \phantomsection
    \color{gray}\vhrulefill{1pt}
}

% Define an environment for resumeentry
\newenvironment{resumeentries} {%
    \vspace{-1.0mm}
    \begin{center}
} {%
    \end{center}
}

% Define an entry of cv information
% Usage: \resumeentry{company}{title}{location}{date}{description}
\newcommand*{\resumeentry}[5] {%
    % \vspace{1.25mm}
    \setlength\tabcolsep{0pt}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
        \ifempty{#1#3}
            {\entrypositionstyle{#2} & \entrydatestyle{#4} \\}
            {\entrytitlestyle{#1} & \entrylocationstyle{#3} \\
            \entrypositionstyle{#2} & \entrydatestyle{#4} \\}
        \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#5}}
    \end{tabular*}%
}

% Just hardcoding this for now
% Eventually will want to spin this out to a generic multi entry command
% Usage: \resumedoubleentry{company}{title 1}{location 1}{date 1}{description 1}{title 2}{date 2}{description 2}
\newcommand*{\resumedoubleentry}[8] {%
    \setlength\tabcolsep{0pt}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
        \entrytitlestyle{#1} & \entrylocationstyle{#3} \\
        \entrypositionstyle{#2} & \entrydatestyle{#4} \\    
        \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#5}}
    \end{tabular*}%
    \vspace{1.5mm}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
        \entrypositionstyle{#6} & \entrydatestyle{#7} \\
        \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#8}}
    \end{tabular*}%
}

% Define an environment for resumeitems(for resumeentry)
\newenvironment{resumeitems}{%
    \vspace{-4.0mm}
    \begin{justify}
    \begin{itemize}[leftmargin=2ex, nosep, noitemsep]
        \setlength{\parskip}{0pt}
        \renewcommand{\labelitemi}{\bullet}
} {%
    \end{itemize}
    \end{justify}
    \vspace{-4.0mm}
}

% Define an environment for resumeskill
\newenvironment{resumeskills} {%
    \vspace{\resumeSectionContentTopSkip}
    \begin{center}
        \setlength\tabcolsep{1ex}
        \setlength{\extrarowheight}{0pt}
        \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} r L{\textwidth * \real{0.9}}}
} {%
    \end{tabular*}
    \end{center}
}

% Define an entry of cv information
% Usage: \resumeeducation{school}{degree}{<location>}{<date>}
\newcommand*{\resumeeducation}[4] {%
    % \vspace{1.25mm}
    \setlength\tabcolsep{0pt}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
        \ifempty{#1#3}
            {\entrypositionstyle{#2} & \entrydatestyle{#4} \\}
            {\entrytitlestyle{#1} & \entrylocationstyle{#3} \\
            \entrypositionstyle{#2} & \entrydatestyle{#4} \\}
    \end{tabular*}%
}

% Define a line of cv information(skill)
% Usage: \resumeskill{<type>}{<skillset>}
\newcommand*{\resumeskill}[2]{%
	\skilltypestyle{#1} & \skillsetstyle{#2} \\
}

