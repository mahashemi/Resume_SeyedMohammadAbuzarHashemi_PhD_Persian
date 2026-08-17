%% Persian-compatible Awesome CV derivative for XeLaTeX / TeX Live 2025
\ProvidesClass{awesome-cv}[2026/08/12 v2.3 Persian-compatible Awesome CV]
\NeedsTeXFormat{LaTeX2e}
\newif\if@cvenglish
\DeclareOption{english}{\@cvenglishtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}
\RequirePackage{ifxetex}
\ifxetex\else\ClassError{awesome-cv}{This class requires XeLaTeX}{Compile with XeLaTeX.}\fi
\RequirePackage{fontspec}
\RequirePackage{geometry}
\RequirePackage{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{enumitem}
\RequirePackage{ragged2e}
\RequirePackage{hyperref}
\RequirePackage{tikz}
\RequirePackage{graphicx}
\RequirePackage{fontawesome5}
\if@cvenglish
  % English LTR mode: no xepersian, so bidi never reverses the layout.
  \setmainfont{Roboto}
  \setsansfont{Roboto}
  % \lr / \rl are no-ops in English mode (xepersian is not loaded).
  \newcommand{\lr}[1]{#1}
  \newcommand{\rl}[1]{#1}
\else
  % bidi (loaded internally by xepersian) requires xcolor AND hyperref to
  % already be loaded, so both must come before this line.
  \RequirePackage{xepersian}
\fi
\geometry{left=2cm,top=1.5cm,right=2cm,bottom=2cm,footskip=.5cm}
\pagestyle{fancy}\fancyhf{}\renewcommand{\headrulewidth}{0pt}

% Primary academic green: restrained but visibly distinct from body text.
\definecolor{awesome-green}{HTML}{2A6F50}
\definecolor{awesome-green-light}{HTML}{4B8067}
\definecolor{darktext}{HTML}{26332B}
\definecolor{text}{HTML}{374151}
\definecolor{graytext}{HTML}{667085}
\definecolor{lighttext}{HTML}{98A2B3}
\colorlet{awesome}{awesome-green}

% Persian/Arabic-script font for Persian text; Roboto is used for explicit
% Latin runs. Keep Latin material inside \lr{...} so bidi never sends it
% through the Persian font or reverses it unexpectedly.
\if@cvenglish
  % English LTR mode: Roboto is the main font (already set above).
\else
  % Noto Sans Arabic is a single-weight file with no distinct bold face,
  % so \bfseries would otherwise render identically to regular text.
  % FakeBold synthetically embolens strokes so bold is actually visible.
  \settextfont[UprightFont=*, BoldFont=*, BoldFeatures={FakeBold=1.8}, ItalicFont=*, ItalicFeatures={FakeSlant=0.2}, BoldItalicFont=*, BoldItalicFeatures={FakeBold=1.8,FakeSlant=0.2}]{Noto Sans Arabic}
  \setlatintextfont{Roboto}
  \setdigitfont{Noto Sans Arabic}
\fi
%----------------------------------------------------------------------------------------
% BISMILLAH TOP BORDER
%----------------------------------------------------------------------------------------

\newcommand{\makebismillah}{%
  \begin{tikzpicture}[remember picture,overlay]
    \node[
      anchor=north,
      yshift=-1mm
    ] at (current page.north)
    {%
      \includegraphics[
        width=0.1\paperwidth
      ]{assets/bismillah_text_green.png}%
    };
  \end{tikzpicture}%
}
\newcommand*{\headerfont}{\rmfamily}\newcommand*{\headerfontlight}{\rmfamily}
\newcommand*{\footerfont}{\rmfamily}\newcommand*{\bodyfont}{\rmfamily}\newcommand*{\bodyfontlight}{\rmfamily}
\newcommand*{\headerfirstnamestyle}[1]{{\fontsize{30pt}{34pt}\selectfont\headerfont\bfseries\color{awesome}#1}}
\newcommand*{\headerlastnamestyle}[1]{{\fontsize{30pt}{34pt}\selectfont\headerfont\bfseries\color{text}#1}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{9pt}{12pt}\selectfont\bodyfont\bfseries\color{awesome}#1}}
\newcommand*{\headersocialstyle}[1]{{\fontsize{7pt}{9pt}\selectfont\bodyfont\color{text}#1}}
\newcommand*{\footerstyle}[1]{{\fontsize{7.5pt}{9pt}\selectfont\footerfont\color{lighttext}#1}}
\newcommand*{\sectionstyle}[1]{{\fontsize{16pt}{20pt}\selectfont\bodyfont\bfseries\color{awesome}#1}}
\newcommand*{\subsectionstyle}[1]{{\fontsize{12pt}{15pt}\selectfont\bodyfont\bfseries\color{awesome}#1}}
\newcommand*{\entrytitlestyle}[1]{{\fontsize{11pt}{13.5pt}\selectfont\bodyfont\fontseries{b}\selectfont\color{darktext}#1}}
\newcommand*{\entrypositionstyle}[1]{{\fontsize{8.5pt}{11pt}\selectfont\bodyfont\color{text}#1}}
\newcommand*{\entrydatestyle}[1]{{\fontsize{8pt}{10pt}\selectfont\bodyfont\color{graytext}#1}}
\newcommand*{\entrylocationstyle}[1]{{\fontsize{8.5pt}{11pt}\selectfont\bodyfont\bfseries\color{awesome}#1}}
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
\newcommand{\acvHeaderSocialSep}{\thinspace\lr{\textbar}\thinspace}\newcommand{\acvHeaderNameDelim}{\space}\newcommand{\acvHeaderAfterNameSkip}{2mm}

% Language-aware header labels: default to Persian; the English document
% overrides these to their English equivalents before \makecvheader is called.
% \providecommand{\linkedinlabel}{لینکدین}
% \providecommand{\scholarlabel}{گوگل اسکالر}
% \providecommand{\emaillabel}{ایمیل}
% \providecommand{\mobilelabel}{تلفن}

% Labels with visible, typeable Latin identifiers. All visible Latin
% material is explicitly LTR; URL targets remain raw for reliable hyperlinks.
\newcommand*{\makecvheader}[1][C]{%
\begin{center}
\headerfirstnamestyle{\@firstname}\acvHeaderNameDelim\headerlastnamestyle{\@lastname}\par
\vspace{\acvHeaderAfterNameSkip}
\ifdefined\@position\headerpositionstyle{\@position}\par\fi
\vspace{0mm}
\headersocialstyle{%
\ifdefined\@linkedin
  \href{https://www.linkedin.com/in/\@linkedin}{\textcolor{awesome}{\faLinkedinIn}\thinspace\lr{\@linkedin}}%
\fi
\ifdefined\@homepage
  \acvHeaderSocialSep\href{https://\@homepage}{\textcolor{awesome}{\faGraduationCap}\thinspace\lr{seyedmohammadabuzar}}%
\fi
\ifdefined\@email
  \acvHeaderSocialSep\href{mailto:\@email}{\textcolor{awesome}{\faEnvelope}\thinspace\lr{\@email}}%
\fi
\ifdefined\@mobile
  \acvHeaderSocialSep\textcolor{awesome}{\faPhone}\thinspace\lr{\@mobile}%
\fi
}
\par\vspace{-1.5mm}
\textcolor{awesome}{\rule{\textwidth}{0.1pt}}\par
\end{center}
\vspace{3mm}}

\newcommand*{\makecvfooter}[3]{\fancyfoot[L]{\footerstyle{#1}}\fancyfoot[C]{\footerstyle{#2}}\fancyfoot[R]{\footerstyle{#3}}}
\newcommand{\cvsection}[1]{\vspace{3mm}\par\noindent\sectionstyle{#1}\par\vspace{-2mm}\noindent\textcolor{awesome}{\rule{\textwidth}{0.4pt}}\vspace{1mm}}
\newcommand{\cvsubsection}[1]{\vspace{2mm}\subsectionstyle{#1}\par}

\newenvironment{cventries}{\begin{center}}{\end{center}}
\newcommand*{\cventry}[5]{\vspace{2mm}\noindent\begin{minipage}{0.97\textwidth}\entrytitlestyle{#2}\hfill\entrylocationstyle{#3}\par\entrypositionstyle{#1}\hfill\entrydatestyle{#4}\par\vspace{1mm}\descriptionstyle{#5}\par\end{minipage}\par\vspace{1mm}}
\newenvironment{cvskills}{\begin{list}{}{\setlength{\leftmargin}{0pt}\setlength{\rightmargin}{0pt}\setlength{\labelwidth}{0pt}\setlength{\labelsep}{0pt}\setlength{\itemindent}{0pt}\setlength{\listparindent}{0pt}\setlength{\parsep}{0pt}\setlength{\topsep}{1pt}\setlength{\itemsep}{3pt}}}{\end{list}}
\newcommand*{\cvskill}[2]{\item\noindent\skilltypestyle{#1}:\enspace\skillsetstyle{#2}}
\newenvironment{cvitems}{\begin{itemize}[leftmargin=1.8em,rightmargin=0.2em,itemsep=1pt,topsep=1pt,parsep=0pt,label=\lr{\textbullet}]\setlength{\parskip}{0pt}}{\end{itemize}}
\newenvironment{cvparagraph}{\vspace{2mm}\descriptionstyle}{\par\vspace{2mm}}
\newenvironment{cvsubentries}{\begin{center}}{\end{center}}
\newcommand*{\cvsubentry}[4]{\subsectionstyle{#2}\hfill\entrydatestyle{#3}\par\entrypositionstyle{#1}\par\descriptionstyle{#4}\par}
\newenvironment{cvhonors}{\begin{center}}{\end{center}}
\newcommand*{\cvhonor}[4]{\entrypositionstyle{#1}\quad\honortitlestyle{#2}\quad\entrylocationstyle{#3}\quad\entrydatestyle{#4}\par}
\newcommand*{\honortitlestyle}[1]{\descriptionstyle{#1}}\newcommand*{\honorpositionstyle}[1]{\entrypositionstyle{#1}}\newcommand*{\honordatestyle}[1]{\entrydatestyle{#1}}\newcommand*{\honorlocationstyle}[1]{\entrylocationstyle{#1}}
\hypersetup{hidelinks,unicode}
\endinput
