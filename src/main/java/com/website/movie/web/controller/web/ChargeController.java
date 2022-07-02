package com.website.movie.web.controller.web;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;
import com.stripe.param.PaymentIntentCreateParams;
import com.website.movie.utils.payment.CurrencyUtil;
import org.javamoney.moneta.Money;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChargeController {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 23/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Value("${stripe.secret.key}")
    private String stripeSecretKey;

    @RequestMapping(value = "/payment", method = RequestMethod.GET)
//    public ModelAndView ChargePayment(OrderDto orderDto){
    public ModelAndView ChargePayment(){
        Stripe.apiKey = stripeSecretKey;
        ModelAndView payment = new ModelAndView("web/payment");
        Long totalAmount = 1000L;
        payment.addObject("totalAmount", Money.of(totalAmount, CurrencyUtil.USD).divide(100).getNumberStripped());
        try {
            PaymentIntentCreateParams createParams = new PaymentIntentCreateParams.Builder()
                    .setCurrency("usd")
                    .setAmount(totalAmount)
                    .build();
            PaymentIntent intent = PaymentIntent.create(createParams);
            payment.addObject("paymentResponse", intent.getClientSecret());
        } catch (StripeException e) {
            e.printStackTrace();
        }
        return payment;
    }


}
