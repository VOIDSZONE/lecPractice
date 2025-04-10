import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ProductForm extends LightningElement {
    productName = '';
    productNumber = '';
    productType = '';

    productTypeOptions = [
        { label: 'Type A', value: 'Type A' },
        { label: 'Type B', value: 'Type B' },
        { label: 'Type C', value: 'Type C' }
    ];

    handleChange(event) {
        const { name, value } = event.target;
        this[name] = value;
    }

    validateForm() {
        const errors = [];

        if (this.productName.length > 5) {
            errors.push('Product Name must be 5 characters or less.');
        }

        const number = Number(this.productNumber);
        if (number < 100 || number > 200) {
            errors.push('Product Number must be between 100 and 200.');
        }

        if (!this.productType) {
            errors.push('Please select a Product Type.');
        }

        if (errors.length > 0) {
            this.showToast('Validation Failed', errors.join(' '), 'error');
        } else {
            this.showToast('Success', 'All validations passed!', 'success');
        }
    }

    showToast(title, message, variant) {
        this.dispatchEvent(new ShowToastEvent({
            title,
            message,
            variant
        }));
    }
}
