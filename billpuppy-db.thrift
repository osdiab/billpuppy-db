struct Bill {
    1: string name
}

service BillpuppyDb {
    /**
     * Creates a bill
     */
    void createBill(),

    /**
     * Gets a bill by id
     *
     * @id - ID of bill to retrieve
     */
    Bill getBillById(1: string id)
}
