package vn.giaiphapthangmay.phantech.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.giaiphapthangmay.phantech.domain.Manufacturer;
import vn.giaiphapthangmay.phantech.repository.ManufacturerRepository;

@Service
public class ManufacturerService {
    private final ManufacturerRepository manufacturerRepository;

    public ManufacturerService(ManufacturerRepository manufacturerRepository) {
        this.manufacturerRepository = manufacturerRepository;
    }

    public List<Manufacturer> getAllManufacturers() {
        return manufacturerRepository.findAll();
    }
}
