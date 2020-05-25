open System

let rec n_o_d cur_num result = 
    match cur_num with
    |0 -> result
    |_ -> n_o_d (cur_num/10) (result+1)

let num_of_digits num =
    n_o_d (num/10) 1


let rec c_p_l num digits cur_period = 
    if (digits%cur_period = 0) then num_of_digits cur_period
    else
        let double_period = digits / num
        let ten_pow = int (Math.Pow(10.0, (float)(num_of_digits cur_period)))
        let period = double_period / ten_pow
        if (cur_period = (int)period) then (num_of_digits cur_period)
        else
            let new_period = int ((ten_pow * 10) / num)
            let new_digits = int (Math.Pow(((float)ten_pow * 10.0), 2.0))
            c_p_l num new_digits new_period


let calculate_period_length num =
    let num_of_d = num_of_digits num
//Число, которое будем делить на num
    let ten_pow = Math.Pow(10.0, (float)(num_of_d + 1))
    let int_num = int num
    let period = int (ten_pow/(float)num)
    let digits = int (Math.Pow(ten_pow, 2.0))
    c_p_l int_num digits period
    

let rec find_d1 cur_d result_d max_period =
    if (cur_d = 10) then result_d
    else
        let period_length = calculate_period_length cur_d
        if (period_length > max_period) then find_d1 (cur_d+1) cur_d period_length
        else find_d1 (cur_d+1) result_d max_period
    

let find_d =
    find_d1 2 2 1

[<EntryPoint>]
let main argv =
    let d = find_d
    System.Console.WriteLine("d = " + d.ToString())
    0 // return an integer exit code
