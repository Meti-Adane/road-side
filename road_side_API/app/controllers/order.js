import { Garage, User, Service, Order  } from "../model/index.js"

//  place order with ispending 
//  notify garage 
//  if garage doesnt update to isPlaced



export const placeOrder = (req, res) => {

    let order = 
        {
            user_id: req.body.user_id,
            garage_id: req.body.garage_id,
            service_id: req.body.service_id,
            description: req.body.description,
            issued_date: req.body.issued_date || Date.now,
            is_pending: true,
        }
    if (!(order.user_id && order.garage_id && order.service_id)) res.status(400).send("BAD REQUEST missing inputs").end();

    if (order.description === '') {
        order.description = await Service.findById(order.service_id, 'name').exec();
    }
    if (typeof order.issued_date !== Date){
        order.issued_date = Date.now();
    }

    newOrder = new Order(order)
    Order.create(newOrder, function (err, order) {
        if (err) res.status(500).send(err || "INTERNAL SERVER ERROR");
        res.status(200).send({
            message:"OK",
            order: order,
        })
      });
}

export const getIncomingOrder = (req, res) => {
    const garage_id = req.params.id;

    if (!garage_id) res.statu(400).send("BAD REQUEST")

    Order.findOne({garage_id: garage_id, is_pending:true}, (err, order) => {
        if (err) res.status(500).send(err || "INTERNAL SERVER ERROR")
        res.status(200).send(
            {
                message:'OK',
                pending_order:order
            }
        )
    } )
}

export const completeOrder = (req, res) => {
    const order_id = req.body.order_id;
    const garage_id = req.body.garage_id;
    const updateDocument = {completed_at: req.body.completed_at || Date.now}

    const query = { id: order_id , garage_id: garage_id};
    const updateDocument = {
        completed_at: Date.now 
    };
    Order.updateOne(query, updateDocument, (err, data) => {
        if (!data) res.status(404).send("CONTENT NOT FOUND couldnt find order with garage id")
        res.status(200).send({
            message: "OK order marked as complete"
        })
    })
}

export const cancelOrder = (req, res) => {
    const {user_id, order_id} = req.body
    const query = {user_id:user_id, id:order_id, is_pending:true}
    Order.deleteOne(query, (err, data) => {
        if (!data) res.status(404).send("CONTENT NOT FOUND order already placed / doesnt exist")
        res.status(204).send({
            message: "NO CONTENT order deleted"
        })
    })

}
