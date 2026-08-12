%% Persian-compatible Awesome CV derivative
%% Rebuilt for XeLaTeX / TeX Live 2025.
%% The original 2017 class depended on the legacy FontAwesome package;
%% this version removes that dependency so Persian documents do not inherit
%% duplicate-command and missing-glyph errors.
\ProvidesClass{awesome-cv}[2026/08/12 v1.7 Persian-compatible Awesome CV]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% Core packages
\RequirePackage{ifxetex}
\ifxetex\else
  \ClassError{awesome-cv}{This class requires XeLaTeX}{Compile the document with XeLaTeX, not pdfLaTeX.}
\fi
\RequirePackage{fontspec}
\RequirePackage{xepersian}
\RequirePackage{geometry}
\RequirePackage{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{enumitem}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{ragged2e}
\RequirePackage{hyperref}
\RequirePackage{etoolbox}

% Layout
\geometry{left=2cm,top=1.5cm,right=2cm,bottom=2cm,footskip=.5cm}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}

% Colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{darktext}{HTML}{414141}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}
\definecolor{awesome-emerald}{HTML}{00A388}
\definecolor{awesome-skyblue}{HTML}{0395DE}
\definecolor{awesome-red}{HTML}{DC3522}
\definecolor{awesome-pink}{HTML}{EF4089}
\definecolor{awesome-orange}{HTML}{FF6138}
\definecolor{awesome-nephritis}{HTML}{27AE60}
\definecolor{awesome-concrete}{HTML}{95A5A6}
\definecolor{awesome-darknight}{HTML}{131A28}
\colorlet{awesome}{awesome-skyblue}

% Font hooks. The document can override these with fontspec/xepersian.
\newcommand*{\headerfont}{\rmfamily}
\newcommand*{\headerfontlight}{\rmfamily}
\newcommand*{\footerfont}{\rmfamily}
\newcommand*{\bodyfont}{\rmfamily}
\newcommand*{\bodyfontlight}{\rmfamily}

% Styles
\newcommand*{\headerfirstnamestyle}[1]{{\fontsize{30pt}{34pt}\selectfont\headerfontlight\color{awesome}#1}}
\newcommand*{\headerlastnamestyle}[1]{{\fontsize{30pt}{34pt}\selectfont\headerfont\bfseries\color{text}#1}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{9pt}{12pt}\selectfont\bodyfont\bfseries\color{awesome}#1}}
\newcommand*{\headersocialstyle}[1]{{\fontsize{7.5pt}{10pt}\selectfont\bodyfont\color{text}#1}}
\newcommand*{\footerstyle}[1]{{\fontsize{7.5pt}{9pt}\selectfont\footerfont\color{lighttext}#1}}
\newcommand*{\sectionstyle}[1]{{\fontsize{16pt}{20pt}\selectfont\bodyfont\bfseries\color{text}#1}}
\newcommand*{\subsectionstyle}[1]{{\fontsize{12pt}{15pt}\selectfont\bodyfont\bfseries\color{text}#1}}
\newcommand*{\entrytitlestyle}[1]{{\fontsize{10.5pt}{13pt}\selectfont\bodyfont\bfseries\color{darktext}#1}}
\newcommand*{\entrypositionstyle}[1]{{\fontsize{8.5pt}{11pt}\selectfont\bodyfont\bfseries\color{graytext}#1}}
\newcommand*{\entrydatestyle}[1]{{\fontsize{8pt}{10pt}\selectfont\bodyfont\color{graytext}#1}}
\newcommand*{\entrylocationstyle}[1]{{\fontsize{8.5pt}{11pt}\selectfont\bodyfont\color{awesome}#1}}
\newcommand*{\descriptionstyle}[1]{{\fontsize{9pt}{12.5pt}\selectfont\bodyfont\color{text}#1}}
\newcommand*{\skilltypestyle}[1]{{\fontsize{9.5pt}{12pt}\selectfont\bodyfont\bfseries\color{darktext}#1}}
\newcommand*{\skillsetstyle}[1]{{\fontsize{9pt}{12pt}\selectfont\bodyfont\color{text}#1}}

% Personal information
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\newcommand*{\address}[1]{\def\@address{#1}}
\newcommand*{\position}[1]{\def\@position{#1}}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}
\newcommand*{\github}[1]{\def\@github{#1}}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}
\renewcommand*{\quote}[1]{\def\@quote{#1}}

\newcommand{\acvHeaderSocialSep}{\quad\textbar\quad}
\newcommand{\acvHeaderNameDelim}{\space}
\newcommand{\acvHeaderAfterNameSkip}{2mm}

% Header: no FontAwesome dependency; text remains selectable and accessible.
\newcommand*{\makecvheader}[1][C]{%
  \begin{center}
    \headerfirstnamestyle{\@firstname}\acvHeaderNameDelim\headerlastnamestyle{\@lastname}\par
    \vspace{\acvHeaderAfterNameSkip}
    \ifdefined\@position{\headerpositionstyle{\@position}\par}{}%
    \vspace{1mm}
    \headersocialstyle{%
      \ifdefined\@mobile{\@mobile}{}%
      \ifdefined\@email{\acvHeaderSocialSep\href{mailto:\@email}{\@email}}{}%
      \ifdefined\@homepage{\acvHeaderSocialSep\href{https://\@homepage}{\@homepage}}{}%
      \ifdefined\@linkedin{\acvHeaderSocialSep\href{https://www.linkedin.com/in/\@linkedin}{\@linkedin}}{}%
      \ifdefined\@github{\acvHeaderSocialSep\href{https://github.com/\@github}{\@github}}{}%
      \ifdefined\@extrainfo{\acvHeaderSocialSep\@extrainfo}{}%
    }\par
  \end{center}
  \vspace{2mm}
}

\newcommand*{\makecvfooter}[3]{%
  \fancyfoot[L]{\footerstyle{#1}}
  \fancyfoot[C]{\footerstyle{#2}}
  \fancyfoot[R]{\footerstyle{#3}}
}

% Sections
\newcommand{\cvsection}[1]{%
  \vspace{3mm}\par\noindent\sectionstyle{#1}\par
  \vspace{1mm}\noindent\textcolor{gray}{\rule{\textwidth}{0.8pt}}\vspace{1mm}
}
\newcommand{\cvsubsection}[1]{\vspace{2mm}\subsectionstyle{#1}\par}

% CV entries
\newenvironment{cventries}{\begin{center}}{\end{center}}
\newcommand*{\cventry}[5]{%
  \vspace{2mm}
  \noindent\begin{minipage}{0.97\textwidth}
    \entrytitlestyle{#2}\hfill\entrylocationstyle{#3}\par
    \entrypositionstyle{#1}\hfill\entrydatestyle{#4}\par
    \vspace{1mm}\descriptionstyle{#5}\par
  \end{minipage}\par
  \vspace{1mm}
}

% Skills
\newenvironment{cvskills}{\begin{tabularx}{0.97\textwidth}{>{\raggedleft\arraybackslash}p{0.25\textwidth} X}}{\end{tabularx}}
\newcommand*{\cvskill}[2]{\skilltypestyle{#1} & \skillsetstyle{#2}\\[1.5mm]}

% Bullet items
\newenvironment{cvitems}{%
  \begin{itemize}[leftmargin=1.8em,rightmargin=0.2em,itemsep=1pt,topsep=1pt,parsep=0pt]
    \setlength{\parskip}{0pt}
}{\end{itemize}}

% Compatibility environments/commands used by Awesome-CV templates
\newenvironment{cvparagraph}{\vspace{2mm}\descriptionstyle}{\par\vspace{2mm}}
\newenvironment{cvsubentries}{\begin{center}}{\end{center}}
\newcommand*{\cvsubentry}[4]{\subsectionstyle{#2}\hfill\entrydatestyle{#3}\par\entrypositionstyle{#1}\par\descriptionstyle{#4}\par}
\newenvironment{cvhonors}{\begin{center}}{\end{center}}
\newcommand*{\cvhonor}[4]{\entrypositionstyle{#1}\quad\honortitlestyle{#2}\quad\entrylocationstyle{#3}\quad\entrydatestyle{#4}\par}
\newcommand*{\honortitlestyle}[1]{\descriptionstyle{#1}}
\newcommand*{\honorpositionstyle}[1]{\entrypositionstyle{#1}}
\newcommand*{\honordatestyle}[1]{\entrydatestyle{#1}}
\newcommand*{\honorlocationstyle}[1]{\entrylocationstyle{#1}}

% Cover-letter compatibility
\newcommand*{\recipient}[2]{\def\@recipientname{#1}\def\@recipientaddress{#2}}
\newcommand*{\recipientname}[1]{\def\@recipientname{#1}}
\newcommand*{\recipientaddress}[1]{\def\@recipientaddress{#1}}
\newcommand*{\lettertitle}[1]{\def\@lettertitle{#1}}
\newcommand*{\letterdate}[1]{\def\@letterdate{#1}}
\newcommand*{\letteropening}[1]{\def\@letteropening{#1}}
\newcommand*{\letterclosing}[1]{\def\@letterclosing{#1}}
\newcommand*{\letterenclname}[1][Enclosure]{\def\@letterenclname{#1}}
\newcommand*{\letterenclosure}[2][]{\def\@letterenclosure{#2}}
\newenvironment{cvletter}{\descriptionstyle}{\par}
\newcommand{\lettersection}[1]{\cvsection{#1}}

\hypersetup{hidelinks,unicode,pdfpagelabels=false}
\endinput
