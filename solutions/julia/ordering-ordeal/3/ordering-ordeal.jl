function sortquantity!(qty)
    inxs = sortperm(qty, rev=true)
    sort!(qty, rev=true)
    return inxs
end

sortcustomer(cust, srtperm) = cust[srtperm]

function production_schedule!(cust, qty)
    inxs = sortquantity!(qty)
    return cust[inxs], sortperm(cust[inxs])
end
