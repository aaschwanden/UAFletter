%% file UAFletter.cls

%% This is an adaption of the ETH brief class.

%% --- Identification part ---
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UAFletter}[2012/3/22 v1.0 UAF Letter]


%% --- Package loading ---
\RequirePackage{UAFlogo}
% Multiple language support (Robert Mach,2004-12-13)
\RequirePackage{ifthen}
\newboolean{@german} \setboolean{@german}{false}

%% --- Declaration of options ---
% Multiple language support (Robert Mach,2004-12-13)
\DeclareOption{german}{\setboolean{@german}{true}} 
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}

%% --- Execution of options ---
\ProcessOptions
\LoadClass[a4paper]{letter}


%% --- Special commands for package and class files ---
\usepackage{lastpage}
\usepackage{hyperref}
\usepackage[T1]{fontenc}
\usepackage[NewCommands]{ragged2e}% Corrects hyphenation in german
%% --- Special class file commands ---


%% --- Defining the (sub-)class ---
\setlength{\textwidth}{16.6cm}
\setlength{\textheight}{23.5cm}
\setlength{\voffset}{-0.49cm}
\setlength{\topmargin}{0cm}
\setlength{\headheight}{0cm}%
\setlength{\headsep}{1.45cm}%

\setlength{\oddsidemargin}{-3mm}
\setlength{\evensidemargin}{\oddsidemargin}
\setlength{\hoffset}{0cm}

\setlength{\topskip}{0cm}
\setlength{\footskip}{15mm}
%

\renewcommand{\encl}[1]{%
\par\noindent
\parbox[t]{\textwidth}{%
\@hangfrom{\normalfont\enclname }%
\ignorespaces #1\strut}}

\renewcommand*{\cc}[1]{%
\par\noindent
\parbox[t]{\textwidth}{%
\@hangfrom{\normalfont\ccname}%
\ignorespaces #1\strut}}

\renewcommand*{\ps}{%
\par\noindent%
}

% Multiple language support (Robert Mach,2004-12-13)
\newcommand{\englishnames}{%
\newcommand{\mypagename}{page}
\renewcommand{\enclname}{\textbf{Enclosures: }}
\renewcommand{\cc}{\textbf{CC: }}
\renewcommand{\ps}{\textbf{PS: }}
}
\newcommand{\germannames}{%
\newcommand{\mypagename}{Seite}
\renewcommand{\enclname}{}%\textbf{Anlage(n): }}
\renewcommand{\ps}{}%\textbf{PS: }}
\renewcommand{\cc}{Kopie }
}

% Multiple language support (Robert Mach,2004-12-13)
\ifthenelse{\boolean{@german}}
{\RequirePackage{german}\germannames}{\englishnames}


% Header definitions for first page 
% and following pages (Robert Mach,2004-12-13)
\renewcommand{\ps@firstpage}
{
\renewcommand{\@oddhead}{}%
\renewcommand{\@oddfoot}{\hfill \raggedleft \mbox{\mypagename~\thepage~/~\pageref{LastPage}}}
\renewcommand{\@evenhead}{}\renewcommand{\@evenfoot}{}}

\renewcommand{\ps@headings}
{
\renewcommand{\@oddhead}{\mbox{\ifx\@empty\BetreffTextHead{\ } \else\textbf{\BetreffTextHead}\fi}}%
\renewcommand{\@oddfoot}{\hfill \raggedleft \mbox{\mypagename~\thepage~/~\pageref{LastPage}}}
\renewcommand{\@evenhead}{\@oddhead}
\renewcommand{\@evenfoot}{\@oddfoot}
}

\pagestyle{headings}


%%%%%%%%%%%%%%%%%%
% With Helvetica fonts
%%%%%%%%%%%%%%%%%%

% Use the following lines if the hevetica fonts should be used
% (Frank Schweitzer, Robert Mach 2004-12-13)
\renewcommand{\familydefault}{phv}
\renewcommand{\sfdefault}{phv}

\DeclareFixedFont{\x}{T1}{phv}{m}{n}{10}
\DeclareFixedFont{\xb}{T1}{phv}{b}{n}{10}
\newfont{\xiiiv}{phvr8t at 8.5pt}
\newfont{\xiiivb}{phvb8t at 8.5pt}





% text parameters
\newcommand{\EinheitNameText}{}
\newcommand{\EinheitInfoText}{}
\newcommand{\PersonNameText}{}
\newcommand{\PersonAdresseText}{}
\newcommand{\PersonInfoText}{}
\newcommand{\OrtText}{Z\"urich}
\newcommand{\BetreffText}{\vspace{-6mm}}
\newcommand{\BetreffTextHead}{\vspace{-6mm}}

\newcommand{\EinheitName}  [1]{\renewcommand{\EinheitNameText}{#1}}
\newcommand{\EinheitInfo}  [1]{\renewcommand{\EinheitInfoText}{#1}}
\newcommand{\PersonName}   [1]{\renewcommand{\PersonNameText}{#1}}
\newcommand{\PersonAdresse}[1]{\renewcommand{\PersonAdresseText}{#1}}
\newcommand{\PersonInfo}   [1]{\renewcommand{\PersonInfoText}{#1}}
\newcommand{\Ort}          [1]{\renewcommand{\OrtText}{#1}}
\newcommand{\Betreff}    [2][]{\renewcommand{\BetreffText}{#2}%
\ifthenelse{\equal{#1}{}}%
{\renewcommand{\BetreffTextHead}{#2}}%
{\renewcommand{\BetreffTextHead}{#1}}
}


% English commands as synonyms (Fritz Zaucker, 2001-01-29)
\let\UnitName\EinheitName
\let\UnitInfo\EinheitInfo
\let\PersonAddress\PersonAdresse
\let\City\Ort
\let\Subject\Betreff
\let\subject\Betreff

\raggedright

\renewcommand{\opening}[1]{%

\thispagestyle{firstpage} % Special style for firstpage

  \setlength{\unitlength}{1mm}
  %% The picture environment is defined in this way 
  %% to ensure that pages following page 1 are right
  %% (Robert Mach, 2004-12-13)
  \begin{picture}(166,63)
    \put(-1,88){
      % Second picture environment to set origin of
      % coordinate system to top left.
      \begin{picture}(0,0)
        \put(0,0){\makebox(0,0)[lt]{\UAFlogo[25mm]}}
        \put(,-44){\makebox(0,0)[lt]{%
          \begin{minipage}[t]{98mm}
            \raggedright \toname \\ \toaddress \par
          \end{minipage}
        }}

        \put(90,0){\makebox(0,0)[lt]{%
          \begin{minipage}[t]{70mm}
            {\textbf{\Large\EinheitNameText}}\\[3mm]
            {\EinheitInfoText} \\[8mm]
            {\xb \PersonNameText}\\[1mm]
            { \PersonAdresseText}\\[5mm]
           {\xiiiv \PersonInfoText}
          \end{minipage}
        }}

        % Alternative:
%         \put(98,0){\makebox(0,0)[lt]{%
%           \begin{minipage}[t][8mm][t]{68mm}
%             {\xiiivb \EinheitNameText}
%             %%\\            \EinheitInfoText
%           \end{minipage}
%         }}
%         \put(98,-9){\makebox(0,0)[lt]{%
%           \begin{minipage}[t]{68mm}
%             {\xiiiv \PersonAdresseText}\\[4mm]
%             {\xiiivb \PersonNameText}\\
%             {\xiiiv \PersonInfoText}
%           \end{minipage}
%         }}

      \end{picture}
    }
  \end{picture}

%  \par
  \OrtText, \@date
  \par
  \ifx\@empty\BetreffText\else\textbf{\BetreffText}\vspace{5mm}\fi
  \par
  {\x #1}
  \par
  \flushbottom
}



\renewcommand{\closing}[1]{\par \ \par \nobreak%
  \stopbreaks
  \noindent
  \ifx\@empty\fromaddress\else
  \hspace*{\longindentation}
  \fi
  \parbox{\indentedwidth}{\raggedright
    \ignorespaces \x #1\\[6\medskipamount]%
    \ifx\@empty\fromsig
    \fromname
    \else \fromsig \fi\strut}%
\ \par
\ \par
}
