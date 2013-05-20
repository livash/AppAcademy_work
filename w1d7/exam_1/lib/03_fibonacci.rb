def fibs(fibs_to_ret)
  return [0] if fibs_to_ret == 1
  return [0,1] if fibs_to_ret == 2
  return [] if fibs_to_ret == 0
  
  #else build fibs sequence
  last_number = fibs(fibs_to_ret - 1)[-1] 
  second_to_last_number = fibs(fibs_to_ret - 1)[-2]
  fibs(fibs_to_ret - 1) + [last_number + second_to_last_number]
end