%% Persian-compatible Awesome CV derivative for XeLaTeX / TeX Live 2025
\ProvidesClass{awesome-cv}[2026/08/12 v2.0 Persian-compatible Awesome CV]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}
\RequirePackage{ifxetex}
\ifxetex\else\ClassError{awesome-cv}{This class requires XeLaTeX}{Compile with XeLaTeX.}\fi
\RequirePackage{fontspec}
\RequirePackage{xepersian}
\RequirePackage{geometry}
\RequirePackage{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{enumitem}
\RequirePackage{ragged2e}
\RequirePackage{hyperref}
\geometry{left=2cm,top=1.5cm,right=2cm,bottom=2cm,footskip=.5cm}
\pagestyle{fancy}\fancyhf{}\renewcommand{\headrulewidth}{0pt}

% Seyed-inspired refined green visual identity
% Slightly lighter than the previous dark green while remaining academic and restrained.
\definecolor{awesome-green}{HTML}{1B6B45}
\definecolor{awesome-green-light}{HTML}{2A7A55}
\definecolor{darktext}{HTML}{26332B}
\definecolor{text}{HTML}{374151}
\definecolor{graytext}{HTML}{667085}
\definecolor{lighttext}{HTML}{98A2B3}
\colorlet{awesome}{awesome-green}

% Persian/Arabic script font. Persian is written with the Arabic-derived script,
% so a Persian-capable Arabic-script font is appropriate. Latin technical terms
% are explicitly typeset with the Latin font using \lr{...}.
\settextfont[
  BoldFont={Noto Sans Arabic Bold},
  ItalicFont={Noto Sans Arabic},
  BoldItalicFont={Noto Sans Arabic Bold}
]{Noto Sans Arabic}
\setlatintextfont{Roboto}
\setdigitfont{Noto Sans Arabic}

\newcommand*{\headerfont}{\rmfamily}\newcommand*{\headerfontlight}{\rmfamily}
\newcommand*{\footerfont}{\rmfamily}\newcommand*{\bodyfont}{\rmfamily}\newcommand*{\bodyfontlight}{\rmfamily}
% The first name is intentionally bold and green as requested.
\newcommand*{\headerfirstnamestyle}[1]{{\fontsize{30pt}{34pt}\selectfont\headerfont\bfseries\color{awesome}#1}}
\newcommand*{\headerlastnamestyle}[1]{{\fontsize{30pt}{34pt}\selectfont\headerfont\bfseries\color{text}#1}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{9pt}{12pt}\selectfont\bodyfont\bfseries\color{awesome}#1}}
\newcommand*{\headersocialstyle}[1]{{\fontsize{7.5pt}{10pt}\selectfont\bodyfont\color{text}#1}}
\newcommand*{\footerstyle}[1]{{\fontsize{7.5pt}{9pt}\selectfont\footerfont\color{lighttext}#1}}
\newcommand*{\sectionstyle}[1]{{\fontsize{16pt}{20pt}\selectfont\bodyfont\bfseries\color{awesome}#1}}
\newcommand*{\subsectionstyle}[1]{{\fontsize{12pt}{15pt}\selectfont\bodyfont\bfseries\color{awesome}#1}}
\newcommand*{\entrytitlestyle}[1]{{\fontsize{10.5pt}{13pt}\selectfont\bodyfont\bfseries\color{darktext}#1}}
\newcommand*{\entrypositionstyle}[1]{{\fontsize{8.5pt}{11pt}\selectfont\bodyfont\bfseries\color{graytext}#1}}
\newcommand*{\entrydatestyle}[1]{{\fontsize{8pt}{10pt}\selectfont\bodyfont\color{graytext}#1}}
\newcommand*{\entrylocationstyle}[1]{{\fontsize{8.5pt}{11pt}\selectfont\bodyfont\color{awesome}#1}}
\newcommand*{\descriptionstyle}[1]{{\fontsize{9pt}{12.5pt}\selectfont\bodyfont\color{text}#1}}
\newcommand*{\skilltypestyle}[1]{{\fontsize{9.5pt}{12pt}\selectfont\bodyfont\bfseries\color{darktext}#1}}
\newcommand*{\skillsetstyle}[1]{{\fontsize{9pt}{12pt}\selectfont\bodyfont\color{text}#1}}

\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}\newcommand*{\address}[1]{\def\@address{#1}}
\newcommand*{\position}[1]{\def\@position{#1}}\newcommand*{\mobile}[1]{\def\@mobile{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}\newcommand*{\homepage}[1]{\def\@homepage{#1}}
\newcommand*{\github}[1]{\def\@github{#1}}\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}
\renewcommand*{\quote}[1]{\def\@quote{#1}}
\newcommand{\acvHeaderSocialSep}{\quad\lr{\textbar}\quad}\newcommand{\acvHeaderNameDelim}{\space}\newcommand{\acvHeaderAfterNameSkip}{2mm}

\newcommand*{\makecvheader}[1][C]{%
\begin{center}\headerfirstnamestyle{\@firstname}\acvHeaderNameDelim\headerlastnamestyle{\@lastname}\par
\vspace{\acvHeaderAfterNameSkip}\ifdefined\@position\headerpositionstyle{\@position}\par\fi\vspace{1mm}
\headersocialstyle{\ifdefined\@mobile\lr{\@mobile}\fi\ifdefined\@email\acvHeaderSocialSep\href{mailto:\@email}{\lr{\@email}}\fi\ifdefined\@homepage\acvHeaderSocialSep\href{https://\@homepage}{\lr{Google Scholar}}\fi\ifdefined\@linkedin\acvHeaderSocialSep\href{https://www.linkedin.com/in/\@linkedin}{\lr{LinkedIn}}\fi\ifdefined\@github\acvHeaderSocialSep\href{https://github.com/\@github}{\lr{\@github}}\fi}\par\end{center}\vspace{2mm}}
\newcommand*{\makecvfooter}[3]{\fancyfoot[L]{\footerstyle{#1}}\fancyfoot[C]{\footerstyle{#2}}\fancyfoot[R]{\footerstyle{#3}}}
\newcommand{\cvsection}[1]{\vspace{3mm}\par\noindent\sectionstyle{#1}\par\vspace{1mm}\noindent\textcolor{awesome}{\rule{\textwidth}{0.8pt}}\vspace{1mm}}
\newcommand{\cvsubsection}[1]{\vspace{2mm}\subsectionstyle{#1}\par}

\newenvironment{cventries}{\begin{center}}{\end{center}}
\newcommand*{\cventry}[5]{\vspace{2mm}\noindent\begin{minipage}{0.97\textwidth}\entrytitlestyle{#2}\hfill\entrylocationstyle{#3}\par\entrypositionstyle{#1}\hfill\entrydatestyle{#4}\par\vspace{1mm}\descriptionstyle{#5}\par\end{minipage}\par\vspace{1mm}}

\newenvironment{cvskills}{\begin{list}{}{\setlength{\leftmargin}{0pt}\setlength{\rightmargin}{0pt}\setlength{\labelwidth}{0pt}\setlength{\labelsep}{0pt}\setlength{\itemindent}{0pt}\setlength{\listparindent}{0pt}\setlength{\parsep}{0pt}\setlength{\topsep}{1pt}\setlength{\itemsep}{3pt}}}{\end{list}}
\newcommand*{\cvskill}[2]{\item\noindent\skilltypestyle{#1}:\enspace\skillsetstyle{#2}}
\newenvironment{cvitems}{\begin{itemize}[leftmargin=1.8em,rightmargin=0.2em,itemsep=1pt,topsep=1pt,parsep=0pt]\setlength{\parskip}{0pt}}{\end{itemize}}
\newenvironment{cvparagraph}{\vspace{2mm}\descriptionstyle}{\par\vspace{2mm}}
\newenvironment{cvsubentries}{\begin{center}}{\end{center}}
\newcommand*{\cvsubentry}[4]{\subsectionstyle{#2}\hfill\entrydatestyle{#3}\par\entrypositionstyle{#1}\par\descriptionstyle{#4}\par}
\newenvironment{cvhonors}{\begin{center}}{\end{center}}
\newcommand*{\cvhonor}[4]{\entrypositionstyle{#1}\quad\honortitlestyle{#2}\quad\entrylocationstyle{#3}\quad\entrydatestyle{#4}\par}
\newcommand*{\honortitlestyle}[1]{\descriptionstyle{#1}}\newcommand*{\honorpositionstyle}[1]{\entrypositionstyle{#1}}\newcommand*{\honordatestyle}[1]{\entrydatestyle{#1}}\newcommand*{\honorlocationstyle}[1]{\entrylocationstyle{#1}}
\hypersetup{hidelinks,unicode}
\endinput
