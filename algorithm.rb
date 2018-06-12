class IntegerQuiz
  def evencheck(num)
    # if num%2 == 0
    #   "Even"
    # else
    #   "Odd"
    # end
    num.even? ? 'Even' : 'Odd'
  end
  
  def gl(n,m)
    # n.gcdlcm(m)
    a = []
    a[0] = gcd(n,m)
    a[1] = (n*m)/a[0]
    return a
  end
  
  def gcd(n,m)
    if n < m
      m, n = n, m
    end
    
    if m == 0
      return n
    end
    
    if n % m == 0
      return m
    else
      # a, b에 대해서 
      # a를 b로 나눈 나머지를 
      # r이라 하면(단, a>b), 
      # a와 b의 최대공약수는 
      # b와 r의 최대공약수와 같다. 
      return gcd(m, n%m)
    end
  end
  
  require 'prime'
  def prime_num(n)
    #Prime.each(n).count
    primes = (2..n).to_a
    # primes = [2,,5,6,7,8,9,10]
    (2..n).each do |num|
      # (2...num).each do |divide|
      (2..num).each do |divide|
        # if(num%divide == 0)
        if(num%divide == 0) && divide != num
          primes.delete(num)
          break
        end
      end
    end
    return primes.length
  end
  
  def sum_d(n)
    (1..n).select{|divide| n % divide == 0}.sum
  end
  
end