package com.tawk.offer.event;

import lombok.*;

@RequiredArgsConstructor
@Getter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
public class ProductOfferEvent {
    private Integer productId;
    private Double discountOffer;
}
