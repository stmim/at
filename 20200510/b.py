nums = input().split(' ')
# values = []
# for i in range(int(nums[0])):
#     values.append(1)
# for i in range(int(nums[1])):
#     values.append(0)
# for i in range(int(nums[2])):
#     values.append(-1)

one_counts = int(nums[0])
zero_counts = int(nums[1])
mone_counts = int(nums[2])
top = int(nums[3])


if one_counts >= top:
    print(top)
else:
    if one_counts + zero_counts >= top:
        print(one_counts)
    else:
        print(one_counts - (top - (one_counts + zero_counts)))
