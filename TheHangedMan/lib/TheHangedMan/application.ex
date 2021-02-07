defmodule TheHangedMan.Application do
    use DynamicSupervisor
    use Application

    def start_link(init_arg) do
        DynamicSupervisor.start_link(TheHangedMan.Server, _init_arg, name: )
    end

    def start_child(settings) do

    end


    # use Application
    #
    # def start(_type, _args) do
    #
    #     import Supervisor.Spec
    #
    #     children = [
    #         worker(TheHangedMan.Server, [])
    #     ]
    #
    #     options = [
    #         name: TheHangedMan.Supervisor,
    #         strategy: :simple_one_for_one
    #     ]
    #
    #     Supervisor.start_link(children, options)
    # end


end
