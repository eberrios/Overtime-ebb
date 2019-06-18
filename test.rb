class Test


  def anagram?(a, b)
    a.split('').sort == b.split('').sort &&  a != b ? true : false
  end

end