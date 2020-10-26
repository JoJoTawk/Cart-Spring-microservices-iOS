package com.tawk.product.event;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@RequiredArgsConstructor
@Getter
@ToString
@EqualsAndHashCode
public class ProductOfferEvent {
    private Integer productId;
    private Double discountOffer;

    public ProductOfferEvent(Integer productId, Double discountOffer) {
        this.productId = productId;
        this.discountOffer = discountOffer;
    }
}
