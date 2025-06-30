# Instructions

In this exercise you'll be writing code to print name badges for factory employees. Employees have an ID, name, and department name. Employee badge labels are formatted as follows: `"[id] - name - DEPARTMENT"`.

## 1. Print a badge for an employee

Implement the `print_name_badge` function. It should take an ID, name, and a department. It should return the badge label, with the department name in uppercase.

```R
print_name_badge(67, "Katherine Williams", "Strategic Communication")
# => "[67] - Katherine Williams - STRATEGIC COMMUNICATION"
```

## 2. Print a badge for a new employee

Due to a quirk in the computer system, new employees occasionally don't yet have an ID when they start working at the factory. As badges are required, they will receive a temporary badge without the ID prefix.

Extend the `print_name_badge` function. When the id is missing, it should print a badge without it.

```R
print_name_badge(NA, "Robert Johnson", "Procurement")
# => "Robert Johnson - PROCUREMENT"
```

## 3. Print a badge for the owner

Even the factory's owner has to wear a badge at all times. However, an owner does not have a department and never will: he is above all the departments. In this case, the label should print `"OWNER"` instead of the department name.

Extend the `print_name_badge` function. When the department is `NULL`, assume the badge belongs to the company owner.

```R
print_name_badge(204, "Rachel Miller", NULL)
# => "[204] - Rachel Miller - OWNER"
```

Note that it is possible for the owner to also be a new employee.

```R
print_name_badge(NA, "Rachel Miller", NULL)
# => "Rachel Miller - OWNER"
```

## 4. Calculate the total salary of emplyees with no ID

As a rough metric of how well the IDs are being issued, you want to see the combined salary of employees with no ID. A high value means lots are waiting, or the problem is affecting senior people: both bad.

Implement the `salaries_no_id` function that takes a vector of IDs and a corresponding vector of salaries, and returns the sum of salaries for people with no ID yet. Both vectors are the same length.

```R
ids <- c(204, NA, 210, 352, NA, 263)
salaries <- c(23, 21, 47, 35, 17, 101) * 1000
salaries_no_id(ids, salaries)
# => 38,000
```
