# LI




2020년 가을학기 Labor Informatics 수업에서 사용하는 코드를 공유하기 위한 공간입니다.

[수업 관련 질문 및 제안 사항 입력하기](https://forms.gle/th48bwn25haPcjKu9)

<br>

# Stata Example Youtube 영상 리스트

- 1 - fhs, 대학알리미, 15:53
- 2 - Generate matrix, 7:58
- 3 - 오피넷(Opinet) 유가 정보 분석, 22:32
- 4 - 심사평가원 의료기관 현황 자료 분석, 30:26
- 5 - 기상청 자료 분석 - 가장 추운 날의 변화, 22:35
- 6 - 서지정보 분석 (사회보장연구, 2011~2015), 38:54
- 7  - KTUS 생활시간조사를 활용한 예제, 19:42
- 8 - 20대 총선 국회의원 선거 투표구별 후보자 득표수 분석(강남구, 서초구), 41:20
- 9 - GOMS(대졸자직업이동경로조사) 2012 분석 예제, 19:38
- 10 - 복지패널 1차년도 자료 분석 사례 (merge 활용하기), 24:33
- 11 - 청년패널 - 아르바이트 관련 분석 (볼륨 작음), 23:27
- 12  - 한국은행 기준금리 변화를 활용한 분석 사례 (볼륨 작음), 18:40

<br>

## Stata Encoding issue

```
unicode encoding set korean
unicode translate *, invalid
```

### HW Template

#### HW 1 Deadline: 09/16(Wed) 11:59pm

```
** 1. fhs example

use fhs, replace

** (a)
count if glucose1==.
* Ans: 397


** (b)

* Ans:




** 2. 대학알리미 성적 분포 분석

** (1)


* Ans:


** (2)
```
