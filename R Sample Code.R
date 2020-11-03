## 홀짝 출력
for (x in 1:20) {
    if (x%%2==0) {
        print(paste(x, "is Even Number"))
        }
    else {
        print(paste(x, "is Odd Number"))
    }
}


## 구구단 테이블
# tab<-matrix(rep(0,81), 9, 9)
tab<-diag(rep(0, 9))
for (i in 1:9) {
    for (j in 1:9) {
        tab[i,j]<-i*j
    }
}
tab

# Outer Product를 이용하는 방법
x=1:9
x %o% x




## Factorial 함수 만들기
fac <- function(n) {
    x=1
    for (i in 1:n) {
        x=x*i
#         print(x)
    }
    return(x)
}



## 피보나치 수열
fibo <- function(n) {
    if (n==1 | n==2) {
        return(1)
    }
    return(fibo(n-1)+fibo(n-2))
}

fibo(5)
fibo(10)

result <- NULL
point<-1:20
for (i in point) {
    result[i]=fibo(i)
}
table=rbind(point,result)
table
