package com.tawk.offer.service;

import com.tawk.offer.model.Offer;
import com.tawk.offer.model.request.OfferRequest;

import java.util.List;

public interface OfferService {
    void addProductOffer(OfferRequest offerRequest);

    List<Offer> getOffers();
}
