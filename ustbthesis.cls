\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ustbthesis}[2025/10/16 v0.2 北京科技大学硕士学位论文模板]
\LoadClass[zihao=-4,a4paper,twoside]{ctexbook}
\RequirePackage{calc,etoolbox,expl3,xparse}

\RequirePackage[x11names,svgnames,table,hyperref]{xcolor}
\RequirePackage[hidelinks]{hyperref}
\ProvideDocumentCommand{\sanhao}{}{\fontsize{16pt}{24pt}\selectfont}
\ProvideDocumentCommand{\erhao}{}{\fontsize{22pt}{33pt}\selectfont}
\ProvideDocumentCommand{\chuhao}{}{\fontsize{42pt}{80pt}\selectfont}
%\RequirePackage[margin=1in]{geometry}
%\RequirePackage[left=2.5cm,right=2.5cm, top=3cm,bottom=2.5cm,includeheadfoot]{geometry}
\RequirePackage[left=3cm,right=3cm, top=3cm,bottom=2cm,bindingoffset=1cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage[multidot,filenameencoding=utf8,space]{grffile}
%\RequirePackage[most,minted]{tcolorbox}
%\RequirePackage[most]{tcolorbox}
\RequirePackage{xeCJKfntef}
\newcommand{\wideunderline}[2][2em]{%
  \underline{\makebox[\ifdim\width>#1\width\else#1\fi]{#2}}%
}

\defaultfontfeatures{Mapping=tex-text}
\renewcommand{\CJKglue}{\hskip 1pt plus 3pt minus 0.6pt}
\RequirePackage{setspace}

\setlength{\parindent}{2em}
\setlength{\parskip}{0.1em plus .1ex minus .1ex}
\linespread{1.3}
\xeCJKsetup{CJKmath=true}

\everydisplay{
\abovedisplayskip0.4em plus 0.1em
\abovedisplayshortskip0.2em plus 0.1em
\belowdisplayskip0.4em plus 0.1em
\belowdisplayshortskip0.2em plus 0.1em
}

\setCJKmainfont{SimSun}[AutoFakeBold=2.5]
%\numberwithin{equation}{chapter}
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
%\renewcommand{\thefigure}{\enspace ss \arabic{figure}}
%\renewcommand{\thetable}{\enspace ss\arabic{table} }

\RequirePackage{titletoc}
\RequirePackage{emptypage}

\titlecontents{chapter}[0em]{\vspace{0pt}\zihao{-4}\songti\normalfont}
    {\thecontentslabel~~}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{section}[1em]{\vspace{0pt}\zihao{-4}\songti}
    {\thecontentslabel~~}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{subsection}[2em]{\vspace{0pt}\zihao{-4}\songti}
    {\thecontentslabel~~}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{subsubsection}[3em]{\vspace{0pt}\zihao{-4}\songti}
    {\thecontentslabel~~}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\setcounter{secnumdepth}{2}  
\setcounter{tocdepth}{2}


\RenewDocumentCommand\contentsname{}{目\hspace{1em}录}
\renewcommand\tableofcontents{%
\cleardoublepage %保证在奇数页
\pagestyle{fancy} %页面风格是empty
%\setlength{\baselineskip}{20pt}
\linespread{1.3} %设置1.3倍行距
%\pdfbookmark[1]{目录}{tableofcontents}
    \if@twocolumn
        \@restonecoltrue\onecolumn
    \else
        \@restonecolfalse
    \fi
        \vskip17pt
    %\centerline{\setstretch{2.41}
    %        \Large\bfseries\heiti\contentsname
    %    }\vskip16.5pt
    \chapter*{目\quad 录}%\addcontentsline{toc}{chapter}{目录}%

    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    %\thispagestyle{empty} %
    \cleardoublepage
}
%% 去掉目录中的加粗
\let\LaTeXStandardTableOfContents\tableofcontents
\renewcommand{\tableofcontents}{% 
\begingroup%
 \renewcommand{\bfseries}{\relax}%
 \LaTeXStandardTableOfContents% 
\endgroup%
 }%


\RequirePackage{paralist}
\RequirePackage{enumitem}
\setlist{nolistsep}

%%% 减少paralist相关环境当中的缩进值。
\setlength{\pltopsep}{0.0pt}
\setlength{\plitemsep}{0.0pt}
\RequirePackage{tabu}
%\tabulinesep=_0pt^5pt
\extrarowsep=_-3pt^5pt
%%% 将tabcolsep设置为0pt有助于将在封面中的字段对齐到缩进24pt的位置，不会产生位置差
\tabcolsep=0pt
\RequirePackage{booktabs}

%%% 附加的表格的环境。
\RequirePackage{colortbl}
\RequirePackage{makecell}
\RequirePackage{multirow}
%%% 如果需要长的宏包的话，就添加长的宏包。
\RequirePackage{longtable}
\RequirePackage[justification=centering]{caption}
\DeclareCaptionLabelFormat{ContFmt}{#1~#2}
\captionsetup[ContinuedFloat]{labelformat=ContFmt}

\RequirePackage{bicaption}

\captionsetup[figure][bi-second]{name=Fig.} %设置图的英文编号前缀
\captionsetup[table][bi-second]{name=Tab.}  %设置表的英文编号前缀
\captionsetup[bi-second]{listtype+=Eng}
\DeclareCaptionFont{cfont}{\heiti\bfseries\zihao{5}\linespread{1.5}}
\captionsetup{font=cfont}
\captionsetup[bi-second]{font=cfont}

\RequirePackage{newfloat}
\DeclareFloatingEnvironment[fileext=lof2]{figureEng}[Fig.][List of Figures]
\DeclareFloatingEnvironment[fileext=lot2]{tableEng}[Tab.][List of Tables]

%% 表格与图片编号
\renewcommand{\thetable}{\thechapter{}-\arabic{table}}
\renewcommand{\thefigure}{\thechapter{}-\arabic{figure}}

\makeatletter
\renewcommand\listoftables{%
        \@starttoc{lot}%
}
\renewcommand\listoffigures{%
        \@starttoc{lof}%
}
\makeatother


% \DeclareCaptionLabelFormat{custom}
% {%
%       #1 \textbf{(#2)}
% }
% % Separator style
% \DeclareCaptionLabelSeparator{custom}{--}
% % Caption format    
% \DeclareCaptionFormat{custom}
% {%
%     #1#2\small #3
% }
% \captionsetup
% {
%     format=custom,%
%     labelformat=custom,%
%     labelsep=custom
% }

%% 引用时图前带有一个空格字符
%\RequirePackage{prettyref}
%%\newrefformat{figure}{图表~[\ref{#1}]}
%\renewcommand{\figurename}{图}
%\newrefformat{fig}{图~\ref{#1}~}
%\RequirePackage{etoolbox}
%\apptocmd{\ref}{~}{}{}



\RequirePackage{enumitem}
\newlist{abbrv}{itemize}{1}
\setlist[abbrv,1]{label=,labelwidth=1in,align=parleft,itemsep=0.1\baselineskip,leftmargin=!}

%\setCJKfamilyfont{xingkai}{STXINGKA.TTF}
%\newcommand{\xingkai}{\CJKfamily{xingkai}}
\setmainfont{Times New Roman}
%\setCJKmainfont[AutoFakeBold,AutoFakeSlant]{SimSun}
%\setCJKmainfont[BoldFont={},ItalicFont={}]{SimSun}

%% 调整引用

% ==== 参考文献：无编号并自动加入目录（主文件无需改动） ====
\makeatletter
\AtBeginDocument{%
  \@ifpackageloaded{biblatex}{%
    % 备份原命令
    \let\USTB@orig@printbibliography\printbibliography
    % 重定义：默认情况（无可选参数）→ 出“参考文献”章标题 + 进目录 + 关闭 biblatex 自带 heading
    % 若用户传了可选参数（如 title= 或 heading= ），则完全尊重用户传参，不额外加标题/目录项
    \RenewDocumentCommand{\printbibliography}{o}{%
      \IfNoValueTF{#1}{%
        \cleardoublepage
        \phantomsection
        \chapter*{参考文献}%
        \addcontentsline{toc}{chapter}{参考文献}%
        \USTB@orig@printbibliography[heading=none]%
      }{%
        \USTB@orig@printbibliography[#1]%
      }%
    }%
  }{}%
}
\makeatother
% ==========================================================




\makeatletter
% 学校代码
\ProvideDocumentCommand{\UniversityCode}{m}{\gdef\ustb@UniversityCode{#1}}
\gdef\ustb@UniversityCode{10008} %%% 默认是北京科技大学的学校代码

% 学号
\ProvideDocumentCommand{\StudentCode}{m}{\gdef\ustb@StudentCode{#1}}
\gdef\ustb@StudentCode{}


% 学校图标文件
\ProvideDocumentCommand{\UniversityLogoFile}{m}{\gdef\ustb@UniversityLogoFile{#1}}
\gdef\ustb@UniversityLogoFile{}
% 作者名称与英文名称
\ProvideDocumentCommand{\Author}{m}{\gdef\ustb@Author{#1}}
\gdef\ustb@Author{}
\ProvideDocumentCommand{\EnglishAuthor}{m}{\gdef\ustb@EnglishAuthor{#1}}
\gdef\ustb@EnglishAuthor{}

% 标题与英文标题
\ProvideDocumentCommand{\Title}{m}{\gdef\ustb@Title{#1}}
\gdef\ustb@Title{}
\ProvideDocumentCommand{\EnglishTitle}{m}{\gdef\ustb@EnglishTitle{#1}}
\gdef\ustb@EnglishTitle{}

% 副标题与英文副标题
\ProvideDocumentCommand{\Subtitle}{m}{\gdef\ustb@Subtitle{#1}}
\gdef\ustb@Subtitle{}
\ProvideDocumentCommand{\EnglishSubtitle}{m}{\gdef\ustb@EnglishSubtitle{#1}}
\gdef\ustb@EnglishSubtitle{}

% 日期中英文
\ProvideDocumentCommand{\Date}{m}{\gdef\ustb@Date{#1}}
\gdef\ustb@Date{}
\ProvideDocumentCommand{\EnglishDate}{m}{\gdef\ustb@EnglishDate{#1}}
\gdef\ustb@EnglishDate{}
% 学院信息中英文
\ProvideDocumentCommand{\College}{m}{\gdef\ustb@College{#1}}
\gdef\ustb@College{}
\ProvideDocumentCommand{\EnglishCollege}{m}{\gdef\ustb@EnglishCollege{#1}}
\gdef\ustb@EnglishCollege{}

% 地址信息
\ProvideDocumentCommand{\Address}{m}{\gdef\ustb@Address{#1}}
\gdef\ustb@Address{}
\ProvideDocumentCommand{\EnglishAddress}{m}{\gdef\ustb@EnglishAddress{#1}}
\gdef\ustb@EnglishAddress{}

% 学校信息
\ProvideDocumentCommand{\Affiliation}{m}{\gdef\ustb@Affiliation{#1}}
\gdef\ustb@Affiliation{}
\ProvideDocumentCommand{\EnglishAffiliation}{m}{\gdef\ustb@EnglishAffiliation{#1}}
\gdef\ustb@EnglishAffiliation{}

% 邮编
\ProvideDocumentCommand{\Postcode}{m}{\gdef\ustb@Postcode{#1}}
\gdef\ustb@Postcode{100083}

% 城市
\ProvideDocumentCommand{\City}{m}{\gdef\ustb@City{#1}}
\gdef\ustb@City{北京}
\ProvideDocumentCommand{\EnglishCity}{m}{\gdef\ustb@EnglishCity{#1}}
\gdef\ustb@EnglishCity{Beijing}

% 国家
\ProvideDocumentCommand{\Country}{m}{\gdef\ustb@Country{#1}}
\gdef\ustb@Country{中国}
\ProvideDocumentCommand{\EnglishCountry}{m}{\gdef\ustb@EnglishCountry{#1}}
\gdef\ustb@EnglishCountry{P.R.CHINA}

% 专业名称中英文
\ProvideDocumentCommand{\Major}{m}{\gdef\ustb@Major{#1}}
\gdef\ustb@Major{}
\ProvideDocumentCommand{\EnglishMajor}{m}{\gdef\ustb@EnglishMajor{#1}}
\gdef\ustb@EnglishMajor{}

% 研究方向
\ProvideDocumentCommand{\Direction}{m}{\gdef\ustb@Direction{#1}}
\gdef\ustb@Direction{}
\ProvideDocumentCommand{\EnglishDirection}{m}{\gdef\ustb@EnglishDirection{#1}}
\gdef\ustb@EnglishDirection{}

% 导师信息中英文
\ProvideDocumentCommand{\Supervisor}{m}{\gdef\ustb@Supervisor{#1}}
\gdef\ustb@Supervisor{}
\ProvideDocumentCommand{\EnglishSupervisor}{m}{\gdef\ustb@EnglishSupervisor{#1}}
\gdef\ustb@EnglishSupervisor{}

% 学位类型中英文
\ProvideDocumentCommand{\DegreeType}{m}{\gdef\ustb@DegreeType{#1}}
\gdef\ustb@DegreeType{}
\ProvideDocumentCommand{\EnglishDegreeType}{m}{\gdef\ustb@EnglishDegreeType{#1}}
\gdef\ustb@EnglishDegreeType{}

% 中图分类号中英文
\ProvideDocumentCommand{\CLCNumber}{m}{\gdef\ustb@CLCNumber{#1}}
\gdef\ustb@CLCNumber{}
% UDC分类号中英文
\ProvideDocumentCommand{\UDCNumber}{m}{\gdef\ustb@UDCNumber{#1}}
\gdef\ustb@UDCNumber{}

% 密级
\ProvideDocumentCommand{\SecurityLevel}{m}{\gdef\ustb@SecurityLevel{#1}}
\gdef\ustb@SecurityLevel{}


% 提交日期中英文
\ProvideDocumentCommand{\SubmissionDate}{m}{\gdef\ustb@SubmissionDate{#1}}
\gdef\ustb@SubmissionDate{}
\ProvideDocumentCommand{\EnglishSubmissionDate}{m}{\gdef\ustb@EnglishSubmissionDate{#1}}
\gdef\ustb@EnglishSubmissionDate{}
\ProvideDocumentCommand{\EnglishKeywords}{m}{\gdef\ustb@EnglishKeywords{#1}}
\gdef\ustb@EnglishKeywords{}

\ProvideDocumentCommand{\ChineseKeywords}{m}{\gdef\ustb@ChineseKeywords{#1}}
\gdef\ustb@ChineseKeywords{}

\makeatletter
\RequirePackage{fancyhdr}
    \fancypagestyle{brief}{
        \fancyhead{}
    \fancyhead[CO]{\zihao{5}\songti　\noindent 北京科技大学硕士学位论文}
    \fancyhead[CE]{}
    %\fancyhead[RO]{\zihao{5}\leftmark}
    \fancyfoot{}
    %\fancyfoot[CO,CE]{\thepage}
    }

    \fancypagestyle{fancy}{
    \fancyhead{}
    \fancyhead[CO]{\zihao{5}\songti　\noindent 北京科技大学硕士学位论文}
    \fancyhead[CE]{\zihao{5}\songti \noindent \ustb@Title }
    %\fancyhead[RO]{\zihao{5}\leftmark}
    \fancyfoot{}
    \fancyfoot[CO,CE]{\thepage}
    }

    %\pagestyle{empty}
    \renewcommand{\headrulewidth}{0.4pt}
    \renewcommand{\baselinestretch}{1.5}
\newcolumntype{Y}{>{\begin{CJKfilltwosides}{2em}}l<{\end{CJKfilltwosides}}}
\ProvideDocumentCommand{\TitlePageTopHeader}{}{
    \vskip-3em
\hfill \begin{CJKfilltwosides}{6em} \bfseries 密级 \end{CJKfilltwosides}：\wideunderline[6em]{\ustb@SecurityLevel}

\hfill \begin{CJKfilltwosides}{6em}\bfseries 加密论文编号 \end{CJKfilltwosides} ：\wideunderline[6em]{}

}
\ProvideDocumentCommand{\TitlePageHeader}{}{
\begin{center}
\hfill \TitlePageTopHeader

%\vfill \centering\includegraphics[height=2.85cm,width=11cm]{\ustb@UniversityLogoFile}
\vskip4cm
%\vfill \centerline{\bfseries\zihao{0}\ziju{0.5} {\kaishu 博士学位论文}}

\end{center}
}
\ProvideDocumentCommand{\TitleBanner}{}{
\begin{center}
    {\zihao{-3}\songti 论文题目：}\zihao{-2}\bfseries\ustb@Title
\end{center}
\begin{center}
\zihao{-2}\bfseries \ifdefempty{\ustb@Subtitle}{}{---\ustb@Subtitle}
\end{center}
}
\ProvideDocumentCommand{\TitlePageFooter}{}{
{\setlength\parindent{22.21mm}
\linespread{1.5}
    \zihao{-3}%\bfseries
    \begin{tabu} to 0.7\textwidth {>{\begin{CJKfilltwosides}{6em}}l<{\end{CJKfilltwosides}} p{1em} X[c]}
    学号&：& \ustb@StudentCode              \\\tabucline{3}
    研究生&：& \ustb@Author \\\tabucline{3}
    专业名称&：& \ustb@Major \\\tabucline{3}
\end{tabu}
}
%\vfill \centerline{\zihao{-3}\bfseries \ustb@Date}
\vfill \centerline{\zihao{-3} \ustb@Date}
}
\ProvideDocumentCommand{\TitlePage}{}{
\pagestyle{empty}
\TitlePageHeader \vfill \TitleBanner \vfill 
    \begin{center}\TitlePageFooter\end{center}
\cleardoublepage
}
\ProvideDocumentCommand{\EnglishTitleBanner}{}{
\begin{center}
\zihao{-2}\bfseries\ustb@EnglishTitle
\end{center}
\begin{center}
\zihao{-2}\bfseries \ifdefempty{\ustb@EnglishSubtitle}{}{---\ustb@EnglishSubtitle}
\end{center}
}

\ProvideDocumentCommand{\SecondPage}{}{
\cleardoublepage
\pagestyle{empty}
%\TitleBanner %中文标题信息
\phantom{}\vskip6pt
\noindent \begin{center}
    %\linespread{1}
    \zihao{-2}\bfseries\ustb@Title

    \ifdefempty{\ustb@Subtitle}{}{\bfseries ---\ustb@Subtitle}
\end{center}

\vfill
\noindent\begin{center}
    \linespread{1.4}
    \zihao{-2}\bfseries\ustb@EnglishTitle

    \zihao{-2}\bfseries \ifdefempty{\ustb@EnglishSubtitle}{}{---\ustb@EnglishSubtitle}
\end{center}

\vfill

\begin{center}
\linespread{1.5}
研究生： \ustb@Author

指导教师： \ustb@Supervisor

北京科技大学 \ustb@College

\ustb@City\ \ustb@Postcode ， \ustb@Country
\end{center}

\vfill

\begin{center}
Doctor Degree Candidate： \ustb@EnglishAuthor

Supervisor: \ustb@EnglishSupervisor

\ustb@EnglishCollege

University of Science and Technology Beijing

\ustb@EnglishAddress

\ustb@EnglishCity \ \ustb@Postcode ， \ustb@EnglishCountry
\end{center}
\vfill

\cleardoublepage
}
\ProvideDocumentCommand{\ThirdPageTopInfo}{}{
{
\zihao{5}\songti
\begin{tabu} to \textwidth {>{\begin{CJKfilltwosides}{5em}}l<{\end{CJKfilltwosides}} p{1em} X[c] >{\begin{CJKfilltwosides}{4em}}l<{\end{CJKfilltwosides}} p{1em} X[c]}
中图分类号& ：& \ustb@CLCNumber & 学校代码 &: & \ustb@UniversityCode \\
\makebox[5em][s]{U\ D\ C}&：& \ustb@UDCNumber & 密级 &: & \ustb@SecurityLevel \\
\end{tabu}}
}
%% 表格信息
\ProvideDocumentCommand{\ThirdPageTitleInfo}{}{
\begin{raggedright}\zihao{4}
\noindent {\bfseries 论文题目：} \wideunderline[11cm]{\zihao{4}\songti\ustb@Title}

\noindent\vskip0.5em 
\phantom{\zihao{4}{\bfseries 论文题目：}}%
\ifdefempty{\ustb@Subtitle}{}{\wideunderline[11cm]{\zihao{4}\songti ---\ustb@Subtitle}}
\end{raggedright}

}

\ProvideDocumentCommand{\ThirdPageAuthorInfo}{}{
\centerline{\zihao{4}{\bfseries 研究生：}\wideunderline[12em]{\ustb@Author}}
}

\ProvideDocumentCommand{\ThirdPageGroupInfo}{}{
    \begin{center}\zihao{4}\linespread{2}
    \bfseries
\noindent \begin{CJKfilltwosides}{8em}指导教师：\end{CJKfilltwosides}\ 
\wideunderline[4em]{xxx}\hfill
单位：\wideunderline[6em]{北京科技大学}\hfill
职称：\wideunderline[3em]{教授}

\noindent \begin{CJKfilltwosides}{8em}指导小组成员：\end{CJKfilltwosides}\ 
\wideunderline[4em]{}\hfill
单位：\wideunderline[6em]{}\hfill
职称：\wideunderline[3em]{}

\noindent \begin{CJKfilltwosides}{8em} \phantom{XX} \end{CJKfilltwosides}\ 
\wideunderline[4em]{}\hfill
单位：\wideunderline[6em]{}\hfill
职称：\wideunderline[3em]{}
\end{center}
}
\ProvideDocumentCommand{\ThirdPage}{}{
\pagestyle{empty}
\ThirdPageTopInfo

\vfill

\centerline{\linespread{1}\zihao{-2}\bfseries 北京科技大学硕士学位论文}

\vfill \ThirdPageTitleInfo

\vfill \ThirdPageAuthorInfo

\vfill\vfill \ThirdPageGroupInfo

\vfill\begin{raggedright}
    \linespread{2} \noindent \zihao{4}
{\bfseries 论文提交日期：} \ustb@Date

\noindent\vskip1em {\bfseries 学位授予单位：北\ 京\ 科\ 技\ 大\ 学}
\end{raggedright}

\vfill
\cleardoublepage
}

%% 中文摘要
\ProvideDocumentEnvironment{ChineseAbstract}{}%
{\cleardoublepage
\pagestyle{fancy}
\pagenumbering{Roman}\setcounter{page}{1}
%\vskip17pt
%\centerline{\heiti\zihao{-3}\linespread{2.41} 摘\quad 要}
\chapter*{\bfseries 摘\quad 要}\addcontentsline{toc}{chapter}{摘要}
\vskip16.5pt
}%
{%\vskip1em
\noindent {\bfseries\zihao{-4} 关键词：}\ustb@ChineseKeywords \cleardoublepage}

\ProvideDocumentEnvironment{EnglishAbstract}{}%
{\cleardoublepage
\pagestyle{fancy}
\begin{center}
\zihao{-3}\bfseries\ustb@EnglishTitle

\vskip17pt
ABSTRACT \addcontentsline{toc}{chapter}{ABSTRACT}
\end{center}
%\begin{center}
%\zihao{-3}\bfseries ---\ustb@EnglishSubtitle
%\end{center}
%\newpage\thispagestyle{empty}
%\pagenumbering{Roman}\setcounter{page}{1}
%\vskip1em
%\chapter*{\bfseries ABSTRACT}
\vskip16.5pt
}{
%\centerline{\bfseries\zihao{3}\linespread{2.41} Abstract}
%\vskip16.5pt

%\vskip1em
\noindent {\bfseries\zihao{-4} Key Words: } \ustb@EnglishKeywords \cleardoublepage
}

%% 序言
\ProvideDocumentEnvironment{Preclude}{}%
{\cleardoublepage
%\pagenumbering{Roman}\setcounter{page}{1}
\vskip17pt
%\centerline{\heiti\zihao{3}\linespread{2.41} 序}
\chapter*{\heiti\bfseries 序(可选)}
\addcontentsline{toc}{chapter}{序(可选)}
\vskip16.5pt
}%
{}
\ProvideDocumentCommand{\TableOfContents}{}{
    \cleardoublepage \zihao{-3}
    \chapter*{目录} %\addcontentsline{toc}{chapter}{目录}
\mainToc
}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
%% 定理环境
\RequirePackage{amsthm}
\newtheorem{definition}{\hspace{2em}定义}[chapter]
\newtheorem{lemma}{\hspace{2em}引理}[chapter]
\newtheorem{theorem}{\hspace{2em}定理}[chapter]
\newtheorem{corollary}{\hspace{2em}推论}[chapter]
\newtheorem{proposition}{\hspace{2em}命题}[chapter]
\newtheorem{assumption}{\hspace{2em}假设}[chapter]
\renewcommand{\proofname}{\indent \textbf{证明}}
\newtheorem*{remark}{\hspace{2em}注}

% 加载算法宏包
\RequirePackage{algorithm}
\RequirePackage{algorithmic}



% 定义算法环境样式（如果需要）
\floatname{algorithm}{算法} % 将算法环境的标题改为 "算法"
\renewcommand{\algorithmicrequire}{\textbf{输入:}} % 输入关键字
\renewcommand{\algorithmicensure}{\textbf{输出:}} % 输出关键字

\DeclareDocumentCommand{\originalityDeclaration}{}{
\cleardoublepage
\vskip17pt
%\centerline{\bfseries\zihao{3}\linespread{2.41} 独创性说明}
\chapter*{独创性声明}
\addcontentsline{toc}{chapter}{独创性说明}
\vskip16.5pt
\pagestyle{empty}
本人声明所呈交的论文是我个人在导师指导下进行的研究工作及取得的研究成果。尽我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得北京科技大学或其它教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示了谢意。

\vspace{2em}
%\noindent 作\,者\,签\,名\,: \wideunderline[5em]{} 日期: \wideunderline[4em]{} 年 \wideunderline[2em]{} 月 \wideunderline[2em]{} 日
\noindent 作\,者\,签\,名\,：\wideunderline[8em]{}\  日期：\wideunderline[4em]{}年\wideunderline[4em]{}月\wideunderline[4em]{}日

%\noindent 导\,师\,签\,名\,: \wideunderline[8em]{} 日期: \wideunderline[4em]{} 年 \wideunderline[2em]{} 月 \wideunderline[2em]{} 日
\noindent 备注：提交时须有作者亲笔签名！
}
\DeclareDocumentCommand{\authorityDeclaration}{}{
\cleardoublepage
\vskip17pt
%\centerline{\bfseries\zihao{3}\linespread{2.41} 关于论文使用授权的说明}
\chapter*{关于论文使用授权的说明}
\addcontentsline{toc}{chapter}{关于论文使用授权的说明}
\vskip16.5pt
\pagestyle{empty}
%本人完全了解北京科技大学有关保留、使用学位论文的规定，即：学校有权保留送交论文的复印件，允许论文被查阅和借阅；学校可以公布论文的全部或部分内容，可以采用影印、缩印或其他复制手段保存论文。
本人完全了解北京科技大学有关保留、使用学位论文的规定，即：学校有权保留送
交论文的复印件，允许论文被查阅和借阅；学校可以公布论文的全部或部分内容，可以
采用影印、缩印或其他复制手段保存论文。

{ （保密的论文在解密后应遵循此规定）}

\vskip3em
\noindent 签名：\wideunderline[6em]{}\ 导师签名：\wideunderline[6em]{}\ 日期：\wideunderline[6em]{}
}
\ProvideDocumentCommand{\DatasetInfo}{}{
\cleardoublepage
\vskip17pt
\chapter*{学位论文数据集}
\addcontentsline{toc}{chapter}{学位论文数据集}
\vskip16.5pt
\noindent\zihao{5}\begin{tabu} to \textwidth{|X|X|X|X|X|}
\hline
关键词* & 密级* & 中图分类号* & UDC & 论文资助 \\\hline
 & & & & \\\hline
\multicolumn2{|l|}{学位授予单位名称*} & 学位授予单位代码* & 学位类别* & 学位级别* \\\hline
& & & & \\\hline
\multicolumn2{|l}{论文题名*} & \multicolumn2{|l|}{并列题名*} & 论文语种* \\\hline
\multicolumn5{|l|}{} \\\hline
\multicolumn3{|l|}{作者姓名*} & \multicolumn2{|l|}{学号*} \\\hline
\multicolumn2{|l|}{培养单位名称*} & 培养单位代码* & 培养单位地址 & 邮编 \\\hline
\multicolumn2{|l|}{} & & & \\\hline
\multicolumn2{|l|}{学科专业*} & 研究方向* & 学制 & 学位授予年 \\\hline
\multicolumn2{|l|}{} & & & \\\hline
论文提交日期* & \multicolumn4{l|}{} \\\hline
\multicolumn3{|l|}{导师姓名*} & \multicolumn2{|l|}{职称*} \\\hline
评阅人 & \multicolumn2{l}{答辩委员会主席*} & \multicolumn2{|l|}{答辩委员会成员} \\\hline
& & & & \\\hline
\multicolumn5{|l|}{电子版论文提交格式  文本（ ）  图像（ ） 视频（ ） 音频（ ） 多媒体（ ） 其他（ ）}\\
\multicolumn5{|l|}{推荐格式：application/msword; application/pdf} \\\hline
\multicolumn2{|l}{电子论文出版（发布）者*} & \multicolumn2{|l|}{电子论文出版（发布）地*} & 权限声明　\\\hline
\multicolumn2{|l}{} & & & \\\hline
论文总页数* & \multicolumn4{l|}{} \\\hline
\multicolumn5{|l|}{共33项，其中带*为必填数据，为22项。}\\\hline
\end{tabu}
}
\ProvideDocumentCommand{\postDeclarations}{}{
%\ctexset{
%    chapter/pagestyle=empty
%}
\originalityDeclaration

\authorityDeclaration
%%% 使用dotline填充见教程<http://tex.stackexchange.com/questions/332357/customizing-the-length-of-dotfill>.

%\DatasetInfo
}

\ctexset{
    chapter/name = {},
    chapter/number = \bfseries\arabic{chapter},
    chapter/format = \heiti\bfseries\centering\zihao{-3},
    chapter/beforeskip=0pt,
    chapter/afterskip=16.5pt,
    chapter/pagestyle=fancy,
    section/format = \heiti\bfseries\zihao{4},
    %section/name = {\arabic{section}.,},
    subsection/format=\heiti\bfseries\zihao{4},
    %subsection/name = {\arabic{subsection}.,},
    subsubsection/format=\heiti\bfseries\zihao{4}
}
\RequirePackage{titlesec}
\titlespacing{\section}{0pt}{10pt}{10pt}
\titlespacing{\subsection}{0pt}{10pt}{10pt}
\titlespacing{\subsubsection}{0pt}{10pt}{10pt}


\setlength{\textfloatsep}{1\baselineskip plus 0.2\baselineskip minus 0.5\baselineskip}

\setlength{\textfloatsep}{5pt}
