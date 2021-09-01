第 i 个人的体重为 people[i]，每艘船可以承载的最大重量为 limit。
每艘船最多可同时载两人，但条件是这些人的重量之和最多为 limit。
返回载到每一个人所需的最小船数。(保证每个人都能被船载)。

### 示例 1：
```
输入：people = [1,2], limit = 3
输出：1
解释：1 艘船载 (1, 2)
```

### 示例 2：
```
输入：people = [3,2,2,1], limit = 3
输出：3
解释：3 艘船分别载 (1, 2), (2) 和 (3)
```

### 示例 3：
```
输入：people = [3,5,3,4], limit = 5
输出：4
解释：4 艘船分别载 (3), (3), (4), (5)
```

### 提示：
- 1 <= people.length <= 50000
- 1 <= people[i] <= limit <= 30000

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/boats-to-save-people

### 解题思路
求的是最少需要多少只船，那要尽量保证每只船坐两个人，所以：
#### 思路1：直接遍历整个people数组，为每一个人找搭档，只要找到可以容下即可以。
问题：是否存在搭配问题？比如所容量是4，那最好是1和3搭配，2和2搭配？
例子: 比如数组[1, 2, 2, 3],容量是4，最少是两条船，假设1，2搭配，2和3无法搭配，则需要三只船。
结论: 不同搭配会影响结果。

#### 思路2：对思路一进行改进，找搭档的时候不是找到即可，而是找相加和最大且不超过船容量的。
例子: 比如数组[1, 2, 2, 3，2，3，1],容量是4。
步骤：
1.遍历数组，当前值为1，往后找到2，可以搭配，记录当前找到的索引，继续往后找；
2.还是2，相加没有大于之前的结果，继续找；
3.找到3，相加大于之前的结果，且打到最大容量，说明是最佳搭配，停止继续查找，标记1和3对应的索引已经组队，
继续下一个没有标记的元素重复之前的步骤查找。
代码：
```
# @param {Integer[]} people
# @param {Integer} limit
# @return {Integer}
def num_rescue_boats(people, limit)
  result = 0

  people.sort!
  flag = Array.new(people.count, false)
  0.upto(people.count - 1) do |i|
    next if flag[i]
    current_weight = people[i]
    if current_weight == limit
      flag[i] = true
      result += 1
      next
    end

    partner_idx = find_partner(people, i, limit, flag)
    flag[partner_idx] = true if partner_idx

    # puts "#{i}(#{people[i]}), #{partner_idx}(#{people[partner_idx || 0]})"
    flag[i] = true
    result += 1
  end
  result
end

def find_partner(people, idx, limit, flag)
  return false if idx == people.count - 1
  target = false
  max_weight = people[idx]
  (idx + 1).upto(people.count - 1) do |j|
    total_weight = people[idx] + people[j]
    next if flag[j] || total_weight > limit

    if total_weight == limit
      target = j
      break
    elsif total_weight > max_weight
      max_weight = total_weight
      target = j
    end
  end
  target
end

```
结果：提交后发现超时。

#### 思路三：思路二需要两次遍历，时间复杂度是n平方，还需要进一步改进。那可能就要想办法在查找搭档的时候，能不能顺便把搭档是独自坐船还是和别人共同坐船也给判断了，也就是遍历一次得到结果。朝这个方向思考，如果排个序，从最轻的人到最重的人依次去找搭档，最轻的人去找最重的人，如果最重的人和自己无法搭档，那他必定和后面所有人都无法搭档，那他必须独自坐一艘船，如果可以搭档，那两人坐一艘船，继续找。
例子: 比如数组[1, 2, 3, 3, 4],容量是4。
步骤：1. 1和4无法搭档，4单独，船数1;
2.1和3可以，船数2；
3.2和3不可以，3单独，船数3；
5.只剩2，2单独，船数4；
代码：
```
def num_rescue_boats(people, limit)
  result, p1, p2 = 0, 0, people.count - 1

  people.sort!
  while p1 <= p2
    if p1 == p2
      result += 1
      break
    end

    p1 += 1 if people[p1] + people[p2] <= limit
    result += 1
    p2 -= 1
  end
  result
end
```