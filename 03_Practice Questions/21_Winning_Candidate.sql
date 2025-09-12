Select Name
From Candidate
Where id = (
    Select Candidate_Id
    From Vote
    Group By Candidate_Id
    Order By Count(*) Desc, Candidate_Id Asc
    Limit 1
);