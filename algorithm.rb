# 짝수 / 홀수

class IntegerQuiz    
    def evencheck(num)
        num.even? ? 'Even' : 'Odd'
    end
    
    def gl(n,m)
        a =[]
        a[0] = gcd(n,m)
        a[1] = n*m/a[0]
        return a
    end
    
    def gcd(n,m)
        #1. 입력으로 두 수 m,n(m>n)이 들어온다.
        #2. n이 0이라면, m을 출력하고 알고리즘을 종료한다.
        #3. m 이 n으로 나누어 떨어지면, n을 출력하고 알고리즘을 종료한다.
        #4. 그렇지 않으면, m을 n으로 나눈 나머지를 새롭게 m에 대입하고, 
        #5. m 과 n을 바꾸고 3번으로 돌아온다.
        if n< m
            m,n = n,m
        end
        
        if m ==0 
            return n
        end
            
        if m%n ==0
            return n
        else
        
            return gcd(m,n%m) 
        end
    end
    
    require 'prime'
    def prime_num(n)
        #Prime.each(n).count
        list = (2..n).to_a
        count =0
        list.each do |i|
            (2...i).each do |j|
                if (i%j==0) && (j != i)
                    list.delete(i)
                    break
                end
            end
        end
        puts list
        return list.length
    end
end