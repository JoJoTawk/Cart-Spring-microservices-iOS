package com.tawk.offer.service;

import com.tawk.offer.event.EventDispatcher;
import com.tawk.offer.event.ProductOfferEvent;
import com.tawk.offer.model.Offer;
import com.tawk.offer.model.request.OfferRequest;
import com.tawk.offer.repository.OfferRepository;
import com.tawk.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class OfferServiceImpl implements OfferService {

    private final OfferRepository offerRepository;
    private EventDispatcher eventDispatcher;

    @Autowired
    public OfferServiceImpl(OfferRepository offerRepository,
                            EventDispatcher eventDispatcher) {
        this.offerRepository = offerRepository;
        this.eventDispatcher = eventDispatcher;
    }

    @Transactional
    @Override
    public void addProductOffer(OfferRequest offerRequest) {
        Optional<Offer> offer = offerRepository.findByProductId(offerRequest.getProductId());
        if(offer.isPresent()){
            offer.get().setDiscountOffer(offerRequest.getDiscountOffer());
        }else {
            offer = Optional.ofNullable(new Offer().builder()
                    .productId(offerRequest.getProductId())
                    .discountOffer(offerRequest.getDiscountOffer())
                    .build());
        }
        offerRepository.save(offer.get());
        eventDispatcher.send(new ProductOfferEvent(offer.get().getProductId(), offer.get().getDiscountOffer()));
    }

    @Override
    public List<Offer> getOffers() {
        return offerRepository.findAll();
    }
}
