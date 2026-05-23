function sortquantity!(qty)
    inxs = sortperm(qty, rev=true)
    sort!(qty, rev=true)
    return inxs
end

function sortcustomer(cust, srtperm)
    return cust[sortperm(srtperm)]
end

function production_schedule!(cust, qty)
    inxs = sortquantity!(qty)
    return cust[inxs], sortperm(cust[inxs])
end
