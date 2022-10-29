import { Modal, Text } from '@mantine/core';
import { useState } from 'react';
import { useForm } from '@mantine/form';
import { TextInput, Button, Box, Code } from '@mantine/core';

interface EditarFuncionarioModalProps {
  opened: boolean;
  onClose: () => void;
  data: { id: number; nome: string; cargo: string; email: string };
}

export function EditarFuncionarioModal({
  data,
  opened,
  onClose,
}: EditarFuncionarioModalProps) {
  return (
    <Modal
      opened={opened}
      onClose={onClose}
      title="Editar Funcionario"
      size="md"
      centered
    >
      {/* <Text>
        Editando funcionario {data.id} - {data.nome}
      </Text> */}
      <form
        onSubmit={form.onSubmit((values) => {
          handleSubmit(values);
        })}
      >
        <Grid grow gutter="xl" mt="lg" mb="lg">
          <Grid.Col span={12}>
            <TextInput
              label="Nome"
              placeholder="Nome"
              mb="md"
              required
              {...form.getInputProps('nome')}
            />
            <Select
              label="Cargo"
              placeholder="Cargo"
              mb="md"
              required
              data={[
                { label: 'Vendedor', value: 'VENDEDOR' },
                { label: 'Gerente', value: 'GERENTE' },
              ]}
              {...form.getInputProps('cargo')}
            />
            <Select
              label="Gerente"
              placeholder="Gerente"
              mb="md"
              data={[...gerentes]}
              {...form.getInputProps('gerente')}
            />
          </Grid.Col>
        </Grid>
        <Box style={{ display: 'flex', justifyContent: 'end', gap: '1rem' }}>
          <Button
            onClick={onClose}
            color="red"
            size="md"
            variant="subtle"
            pl="xl"
            pr="xl"
          >
            Cancelar
          </Button>
          <Button type="submit" color="blue" size="md" pl="xl" pr="xl">
            Salvar
          </Button>
        </Box>
      </form>
    </Modal>
  );
}
