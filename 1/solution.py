sums = [0]

with open("input.txt") as fp:
    for line in fp:
        match line.strip():
            case "":
                sums.append(0)
            case num:
                sums[-1] += int(num)

print(max(sums))
print(sum(sorted(sums)[-3:]))
