users = [
    person_1: %{
        name: "John",
        age: 27,
        languages: ["erlang", "elixir"]
    },
    person_2: %{
        name: "Connor",
        age: 20,
        languages: ["java", "elixir"]
    },
]

IO.puts users[:person_1].name # John

# to update a value
users = put_in users[:person_1].age, 31
IO.puts users[:person_1].age # 31