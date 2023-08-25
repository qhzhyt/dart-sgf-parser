var sgfList = [
  '(;CA[utf8]AB[dn][cn][bm][fq][gq][gp][dp][dq][ep][do]AW[cp][co][dl][cl][bl][ip][dr][eq][er][fr][fp][fo][eo][cq]C[手筋题：黑先]AP[StoneBase:SGFParser.3.0]SZ[19]GM[1]GN[   ]EV[4]HA[0]SO[]MULTIGOGM[1];B[gn];W[fn];B[fm];W[em];B[en]C[right])',
  '''(;AW[pd]AP[MultiGo:4.2.4]SZ[19]GN[     入神图]US[桥本宇太郎解说]SO[《玄玄棋经》]MULTIGOGM[1];B[qf]N[1变];W[qh];B[of];W[oh];B[nd]LB[od:A]C[                      黑5小飞，与“大角势”、“小角势”相同。“玉井栏”、“金井栏”中，黑5在A位碰。];W[oe]LB[ne:A][rd:B][re:C][nc:D]C[“大角势”中，白6从A位跨出。“小角势”中，白B和黑C交换后，于D位托。];B[pe];W[od];B[ne];W[re];B[rf];W[nf]C[白6以下12之断稍微有些无理吧];B[qd];W[qc];B[nc];W[og];B[pf];W[rd];B[rb]C[黑19之点为妙手，到底是局部之要点。](;W[ob];B[oc];W[pc];B[rc];W[qe];B[qb];W[pb];B[nb];W[rg];B[se]C[黑29止，攻杀黑胜。])(;W[qe]N[2变];B[qb];W[pb];B[oc];W[pc];B[rc]C[还原成第1变，黑胜。](;W[bc];B[cc]C[还原])(;W[ac];B[dc]C[黑胜。])))''',
  '(;CA[gb2312]AB[eo][fo][gp][ip][cq][cp][dq][do]AW[dp][ep][fp][dr][co][bo][dn][cm][er]LB[er:1]AP[MultiGo:4.4.4]SZ[19]MULTIGOGM[0];B[eq];W[fq];B[fr];W[gq];B[gr];W[hq];B[hr];W[iq];B[jq];W[ir];B[jr])'
];

var sgflist2 = [
  {
    'source': """(

;AW[pd]AP[MultiGo:4.2.4]SZ[19]GN[入神图]US[桥本宇太郎解说]SO[《玄玄棋经》]MULTIGOGM[1]
;B[qf]N[1变];W[qh];B[of];W[oh];B[nd]LB[od:A]C[黑5小飞，与“大角势”、“小角势”相同。

“玉井栏”、“金井栏”中，黑5在A位碰。]
;W[oe]LB[ne:A][rd:B][re:C][nc:D]C[“大角势”中，白6从A位跨出。“小角势”中，白B和黑C交换后，于D位托。]
;B[pe];W[od];B[ne];W[re];B[rf];W[nf]C[白6以下12之断稍微有些无理吧];B[qd];W[qc];B[nc]
;W[og];B[pf];W[rd];B[rb]C[黑19之点为妙手，到底是局部之要点。]

(;W[ob];B[oc];W[pc];B[rc];W[qe];B[qb];W[pb];B[nb];W[rg];B[se]C[黑29止，攻杀黑胜。])


(;W[qe]N[2变];B[qb];W[pb];B[oc];W[pc];B[rc]C[还原成第1变，黑胜。])

)""",
    'expect':
        "(;AW[pd]AP[MultiGo:4.2.4]SZ[19]GN[入神图]US[桥本宇太郎解说]SO[《玄玄棋经》]MULTIGOGM[1];B[qf]N[1变];W[qh];B[of];W[oh];B[nd]LB[od:A]C[黑5小飞，与“大角势”、“小角势”相同。\n\n“玉井栏”、“金井栏”中，黑5在A位碰。];W[oe]LB[ne:A][rd:B][re:C][nc:D]C[“大角势”中，白6从A位跨出。“小角势”中，白B和黑C交换后，于D位托。];B[pe];W[od];B[ne];W[re];B[rf];W[nf]C[白6以下12之断稍微有些无理吧];B[qd];W[qc];B[nc];W[og];B[pf];W[rd];B[rb]C[黑19之点为妙手，到底是局部之要点。](;W[ob];B[oc];W[pc];B[rc];W[qe];B[qb];W[pb];B[nb];W[rg];B[se]C[黑29止，攻杀黑胜。])(;W[qe]N[2变];B[qb];W[pb];B[oc];W[pc];B[rc]C[还原成第1变，黑胜。]))"
  },
  {
    'source':
        """(;AB[oq][nr][nq][pq][pr][ps][qp][rp][qo][rn][qm][rl]AW[qs][qr][qq][rq][pp][op][np]
[po][pn][qn][lp][mq][lr]C[这个情况如果单纯攻杀则是黑四气白三气，白棋赢不了。因为黑气不会减少，所以应该考虑如何长白气吧。

云怎么样才能形成霞呢？]
AP[MultiGo:4.2.4]SZ[19]GN[云起成霞]RE[白先黑死]US[桥本宇太郎解说]SO[《玄玄棋经》]
MULTIGOGM[1]
;W[sp]N[正解];B[ro]
(;W[rs]TR[qs][qr][qq][rq]C[白1然后3位弯为妙手，必须确认3位乃四白△子所成棋形之急所。

此乃“乌龟拐”之妙形。]
;B[sr];W[mr];B[sq];W[ns]LB[rr:A]C[黑4只好如此，但因1、3，白棋长了一气，以后白5、7紧气，攻杀快一气。

黑棋无法直接于A位入子为得意之处。])
(;W[mr]N[失败];B[rs]TR[qs][qr][qq][rq][ps]C[先手利之后，白棋直接紧气则失败。黑2靠在四个白△子的腰眼上，白痛苦不堪。

johny注：为什么黑2之处为此形的要点？去掉黑▲子、黑2和三一路的白△子，此形最初可看成由余下的三个白△子组成。此即《棋经众妙》攻杀之部的第17型，是角部对杀的基本型。之后的进行，可以看成黑2和三一路的白△交换，次黑▲贴住。黑2点入，正是第17型之手筋，为“2之一”之急所。]
;W[sr];B[so];W[ns];B[sq]C[白3虽是有弹性之手法，但黑4、6成为劫争。

无条件吃的棋下成劫争，失败。]))""",
    'expect':
        "(;AB[oq][nr][nq][pq][pr][ps][qp][rp][qo][rn][qm][rl]AW[qs][qr][qq][rq][pp][op][np][po][pn][qn][lp][mq][lr]C[这个情况如果单纯攻杀则是黑四气白三气，白棋赢不了。因为黑气不会减少，所以应该考虑如何长白气吧。\n\n云怎么样才能形成霞呢？]AP[MultiGo:4.2.4]SZ[19]GN[云起成霞]RE[白先黑死]US[桥本宇太郎解说]SO[《玄玄棋经》]MULTIGOGM[1];W[sp]N[正解];B[ro](;W[rs]TR[qs][qr][qq][rq]C[白1然后3位弯为妙手，必须确认3位乃四白△子所成棋形之急所。\n\n此乃“乌龟拐”之妙形。];B[sr];W[mr];B[sq];W[ns]LB[rr:A]C[黑4只好如此，但因1、3，白棋长了一气，以后白5、7紧气，攻杀快一气。\n\n黑棋无法直接于A位入子为得意之处。])(;W[mr]N[失败];B[rs]TR[qs][qr][qq][rq][ps]C[先手利之后，白棋直接紧气则失败。黑2靠在四个白△子的腰眼上，白痛苦不堪。\n\njohny注：为什么黑2之处为此形的要点？去掉黑▲子、黑2和三一路的白△子，此形最初可看成由余下的三个白△子组成。此即《棋经众妙》攻杀之部的第17型，是角部对杀的基本型。之后的进行，可以看成黑2和三一路的白△交换，次黑▲贴住。黑2点入，正是第17型之手筋，为“2之一”之急所。];W[sr];B[so];W[ns];B[sq]C[白3虽是有弹性之手法，但黑4、6成为劫争。\n\n无条件吃的棋下成劫争，失败。]))"
  },
  {
    'source':
        '(;CA[utf8]AB[ea][da][db][ec][kf][fd][gc][hd][je][qb][jg][me][oe][jb][kb][lc][mc][nc][pc]AW[eb][rb][rc][qd][qf][nd][md][ld][kd][kc][jc][ic][gb][ga][fa][fb][fc]C[死活题\: 白先]AP[MultiGo:4.4.4]SZ[19]AB[dd]MULTIGOGM[1];W[ne];B[nf];W[mf];B[ng];W[lf];B[lg];W[od];B[pd];W[pe];B[of];W[mg];B[mh];W[le];B[nh];W[ib](;B[ia];W[hc];B[gd];W[oc];B[ob](;W[ja];B[ka];W[ma]C[好手];B[mb];W[pb];B[pa];W[qc];B[pb](;W[ha]C[不好];B[hb];W[na];B[nb]C[不好];W[gb];B[ha];W[ga];B[oa];W[ja];B[ia];W[ha];B[ja]C[不好];W[la];B[lb];W[ma];B[ra];W[sb];B[fb];W[sa]C[right])(;W[na](;B[nb]C[失误];W[la];B[hb];W[ha];B[hb];W[gb];B[ha];W[ga];B[lb];W[ja];B[ia];W[ra];B[fb];W[ha];B[fa]C[right])(;B[la]C[正确];W[ha];B[hb];W[gb];B[ha];W[ga];B[nb];W[ja];B[ia];W[ha];B[oa];W[ja]C[right])))(;W[ma];B[mb];W[ja];B[ha];W[hb];B[ia];W[pb];B[pa];W[qc];B[pb];W[na];B[la];W[ha];B[nb];W[ia];B[ra];W[sb];B[id];W[ka];B[lb];W[sa]C[right]))(;B[hb]C[不好];W[ja](;B[lb];W[oc];B[ob];W[qa](;B[pa];W[qc];B[pb];W[nb];B[ra];W[na];B[ma];W[ka]C[right])(;B[nb];W[pa];B[pb];W[ma]C[right]))(;B[la];W[oc];B[ob];W[qa];B[mb];W[na]C[right])))',
    'expect':
        '(;CA[utf8]AB[ea][da][db][ec][kf][fd][gc][hd][je][qb][jg][me][oe][jb][kb][lc][mc][nc][pc][dd]AW[eb][rb][rc][qd][qf][nd][md][ld][kd][kc][jc][ic][gb][ga][fa][fb][fc]C[死活题\: 白先]AP[MultiGo:4.4.4]SZ[19]MULTIGOGM[1];W[ne];B[nf];W[mf];B[ng];W[lf];B[lg];W[od];B[pd];W[pe];B[of];W[mg];B[mh];W[le];B[nh];W[ib](;B[ia];W[hc];B[gd];W[oc];B[ob](;W[ja];B[ka];W[ma]C[好手];B[mb];W[pb];B[pa];W[qc];B[pb](;W[ha]C[不好];B[hb];W[na];B[nb]C[不好];W[gb];B[ha];W[ga];B[oa];W[ja];B[ia];W[ha];B[ja]C[不好];W[la];B[lb];W[ma];B[ra];W[sb];B[fb];W[sa]C[right])(;W[na](;B[nb]C[失误];W[la];B[hb];W[ha];B[hb];W[gb];B[ha];W[ga];B[lb];W[ja];B[ia];W[ra];B[fb];W[ha];B[fa]C[right])(;B[la]C[正确];W[ha];B[hb];W[gb];B[ha];W[ga];B[nb];W[ja];B[ia];W[ha];B[oa];W[ja]C[right])))(;W[ma];B[mb];W[ja];B[ha];W[hb];B[ia];W[pb];B[pa];W[qc];B[pb];W[na];B[la];W[ha];B[nb];W[ia];B[ra];W[sb];B[id];W[ka];B[lb];W[sa]C[right]))(;B[hb]C[不好];W[ja](;B[lb];W[oc];B[ob];W[qa](;B[pa];W[qc];B[pb];W[nb];B[ra];W[na];B[ma];W[ka]C[right])(;B[nb];W[pa];B[pb];W[ma]C[right]))(;B[la];W[oc];B[ob];W[qa];B[mb];W[na]C[right])))',
  },
  {
    'source': """(;FF[4]CA[UTF-8]AP[GoGui:1.4.2]
KM[0]DT[2012-09-22]
AB[qd][od][pq][iq][eq]AW[dc][de][cp][qo]
C[第1问 白先#n 
布局的常识#n 
这是分先棋的布局。问题的焦点集中在右下方。白先，下一步走在哪里？可于A、B、C三点中选择。满分20分#n]
PL[W]GC[QuizJudge]
(;W[qj];B[op]C[10分；白1大有疑问。黑2占据好点后，右边白呈薄形。同时，下边黑地也得以扩张。]sc[10])
(;W[op];B[oq]sc[10];W[np];B[mq]sc[5];W[qj]
C[20分；在此场合白1飞压是常识性着手。黑如2应，白3利用一手后再于5位抢占大场，形势生动，发展潜力很大。反之下边黑子却都处于低位，缺乏效率。#n]sc
[5])
(;W[mq];B[op]C[5分；白1被黑2尖出结果更坏，在黑势力圈中作战不会有好结果。#n]sc[5]))
""",
    'expect':
        """(;FF[4]CA[UTF-8]AP[GoGui:1.4.2]KM[0]DT[2012-09-22]AB[qd][od][pq][iq][eq]AW[dc][de][cp][qo]C[第1问 白先#n \n布局的常识#n \n这是分先棋的布局。问题的焦点集中在右下方。白先，下一步走在哪里？可于A、B、C三点中选择。满分20分#n]PL[W]GC[QuizJudge](;W[qj];B[op]C[10分；白1大有疑问。黑2占据好点后，右边白呈薄形。同时，下边黑地也得以扩张。]sc[10])(;W[op];B[oq]sc[10];W[np];B[mq]sc[5];W[qj]C[20分；在此场合白1飞压是常识性着手。黑如2应，白3利用一手后再于5位抢占大场，形势生动，发展潜力很大。反之下边黑子却都处于低位，缺乏效率。#n]sc[5])(;W[mq];B[op]C[5分；白1被黑2尖出结果更坏，在黑势力圈中作战不会有好结果。#n]sc[5]))"""
  }
];

var toleranceSgf = [
  {'source': '(;))', 'expect': '(;)'},
  {'source': '(;AS[0]))', 'expect': '(;AS[0])'}
];

var errorSgfList = [
  {
    'source': 'ASDFG',
    'expect': "Exception: 0: sgf parse fail, SGF should start with '('"
  },
  {
    'source': ';ASDFG',
    'expect': "Exception: 0: sgf parse fail, SGF should start with '('"
  },
  {
    'source': '(;ASDFG',
    'expect': "Exception: 7: sgf parse fail, Expected a '[', but got null"
  },
  {
    'source': '(;AS[DFG',
    'expect': "Exception: 8: sgf parse fail, Expected a ']', but got null"
  },
  {
    'source': '(;AD)',
    'expect': "Exception: 4: sgf parse fail, Expected a '[', but got ')'"
  },
  {
    'source': '(AS)',
    'expect': "Exception: 1: sgf parse fail, Expected a ';', '(' or ')', but got 'A'"
  },
  {
    'source': '(;AS[]])',
    'expect': "Exception: 6: sgf parse fail, Expected a '[', but got ']'"
  },
  {
    'source': '(;[)',
    'expect': "Exception: 2: sgf parse fail, Expected a attribute name, but got '['"
  },
  {
    'source': '(;^[123])',
    'expect': "Exception: 2: sgf parse fail, Expected a attribute name, but got '^'"
  },
];
