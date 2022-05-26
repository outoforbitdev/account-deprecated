﻿import React from 'react';
import { TextField } from '../core/Components/TextField';
import { Modal } from '../core/Components/Modal';
import { PasswordField } from '../core/Components/PasswordField';
import { Button } from '../core/Components/Button';
import { Link } from '../core/Components/Link';
import { StyleThemes } from '../core/Components/IComponentProps';
import { IComponentProps } from '../core/Components/IComponentProps';

export function Login(props: IComponentProps) {
    return (
        <Modal>
            <label>Username</label>
            <div><TextField clearable /></div>
            <div><span /></div>
            <label>Password</label>
            <div><PasswordField showable /></div>
            <Button text={"Login"}
                width={"234px"}
            /><br/>
            <Link>Create Account</Link>
        </Modal>
    );
}