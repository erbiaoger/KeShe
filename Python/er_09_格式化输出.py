name = "小明"
print("我的名字叫%s" % name)

student_no = 2
print("我的学号是 %06d" % student_no)

price = float(input("输入价格   "))
weight = float(input("输入重量   "))
money = price * weight

print("苹果的价格是 %.2f 元/斤,购买了 %.3f 斤，需要支付 %.4f 元" %(price, weight, money))
